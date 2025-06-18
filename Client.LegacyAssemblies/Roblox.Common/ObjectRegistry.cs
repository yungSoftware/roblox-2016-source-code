using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading;

namespace Roblox
{
    public class ObjectRegistry<TKey, TValue> : IDisposable, IEnumerable<KeyValuePair<TKey, TValue>>, IEnumerable
    {
        public int Count => count;

        private IDictionary<TKey, Reference> GetDictionary(TKey key)
            => dictionaries[(int)checked((IntPtr)unchecked((ulong)key.GetHashCode() % (ulong)dictionaries.Length))];

        static ObjectRegistry()
        {
            if (!PerformanceCounterCategory.Exists(perfCategory))
            {
                var collection = new CounterCreationDataCollection();
                collection.Add(new CounterCreationData("Count", "", PerformanceCounterType.NumberOfItems32));
                collection.Add(new CounterCreationData("Total Purged", "", PerformanceCounterType.NumberOfItems64));
                collection.Add(new CounterCreationData("Purge Rate", "", PerformanceCounterType.RateOfCountsPerSecond32));
                PerformanceCounterCategory.Create(perfCategory, "", PerformanceCounterCategoryType.MultiInstance, collection);
            }
        }

        public ObjectRegistry(Configuration configuration)
        {
            var references = new Dictionary<TKey, Reference>[1024];
            dictionaries = references;
            for (int i = 0; i < dictionaries.Length; i++)
                dictionaries[i] = new Dictionary<TKey, Reference>();
            perfItemCount = new PerformanceCounter(perfCategory, "Count", configuration.Name, false);
            perfItemCount.RawValue = 0;
            perfItemTotalPurged = new PerformanceCounter(perfCategory, "Total Purged", configuration.Name, false);
            perfItemTotalPurged.RawValue = 0;
            perfPurgeRate = new PerformanceCounter(perfCategory, "Purge Rate", configuration.Name, false);
            perfPurgeRate.RawValue = 0;
            getter = configuration.Getter;
            Lease = configuration.Lease;
            HasLease = Lease > TimeSpan.Zero;
            timer = new Timer(s => Purge(), null, configuration.PurgeFrequency, configuration.PurgeFrequency);
        }

        private void IncrementPerfCountersForPurge(int magnitude)
        {
            perfPurgeRate?.IncrementBy(magnitude);
            perfItemCount?.IncrementBy(-1 * magnitude);
            perfItemTotalPurged?.IncrementBy(magnitude);
        }

        public void Add(TKey key, TValue value)
        {
            perfItemCount?.Increment();
            var dict = GetDictionary(key);
            lock (dict)
                dict.Add(key, HasLease ? new LeasedReference(value, Lease) : new Reference(value));
            Interlocked.Increment(ref count);
        }

        public TValue Get(TKey key)
        {
            TValue val;
            if (getter == null)
                TryGetValue(key, out val);
            else
            {
                var dict = GetDictionary(key);
                lock (dict)
                {
                    if (!dict.TryGetValue(key, out var reference))
                    {
                        val = getter(key);
                        if (val != null) Add(key, val);
                    }
                    else
                    {
                        val = reference.Target;
                        if (val == null)
                        {
                            val = getter(key);
                            reference.Renew(val);
                        }
                    }
                }
            }

            return val;
        }

        public ReadOnlyCollection<TValue> GetValues()
        {
            var list = new List<TValue>();
            foreach (var dict in dictionaries)
            {
                lock (dict)
                {
                    foreach (var reference in dict.Values)
                    {
                        var target = reference.Target;
                        if (target != null) list.Add(target);
                    }
                }
            }

            return new ReadOnlyCollection<TValue>(list);
        }

        public bool TryGetValue(TKey key, out TValue value)
        {
            var dict = GetDictionary(key);
            lock (dict)
            {
                if (!dict.TryGetValue(key, out var reference))
                {
                    value = default(TValue);
                    return false;
                }

                value = reference.Target;
                if (value == null)
                {
                    IncrementPerfCountersForPurge(1);
                    Interlocked.Decrement(ref count);
                    dict.Remove(key);
                    return false;
                }
            }

            return true;
        }

        public void Remove(TKey key)
        {
            perfItemCount?.Decrement();
            Interlocked.Decrement(ref count);
            var dict = GetDictionary(key);
            lock (dict) dict.Remove(key);
        }

        public void Purge()
        {
            foreach (var dict in dictionaries)
            {
                lock (dict)
                {
                    ICollection<KeyValuePair<TKey, Reference>> coll = null;
                    foreach (var reference in dict)
                    {
                        if (!reference.Value.IsAlive)
                        {
                            if (coll == null) coll = new List<KeyValuePair<TKey, Reference>>();
                            coll.Add(reference);
                            Interlocked.Decrement(ref count);
                        }
                    }

                    if (coll != null)
                    {
                        IncrementPerfCountersForPurge(coll.Count);
                        foreach (var i in coll)
                            dict.Remove(i);
                    }
                }
            }
        }

        public void Dispose()
        {
            timer?.Dispose();
            perfItemCount?.Dispose();
            perfItemTotalPurged?.Dispose();
            perfPurgeRate?.Dispose();
        }

        public IEnumerator<KeyValuePair<TKey, TValue>> GetEnumerator()
        {
            foreach (var dict in dictionaries)
            {
                lock (dict)
                {
                    foreach (var reference in dict)
                    {
                        var target = reference.Value.Target;
                        if (target != null) yield return new KeyValuePair<TKey, TValue>(reference.Key, target);
                    }
                }
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            foreach (var dict in dictionaries)
            {
                lock (dict)
                {
                    foreach (var reference in dict)
                    {
                        var target = reference.Value.Target;
                        if (target != null) yield return new KeyValuePair<TKey, TValue>(reference.Key, target);
                    }
                }
            }
        }

        public readonly TimeSpan Lease;
        public readonly bool HasLease;
        private int count;
        private readonly IDictionary<TKey, Reference>[] dictionaries;
        private readonly Getter getter;
        private readonly Timer timer;
        private static readonly string perfCategory = "Roblox.Common.ObjectRegistry.2";
        private readonly PerformanceCounter perfItemCount;
        private readonly PerformanceCounter perfItemTotalPurged;
        private readonly PerformanceCounter perfPurgeRate;

        private class Reference
        {
            public Reference(TValue value) => weakReference = new WeakReference(value);

            public virtual TValue Target => (TValue) weakReference.Target;

            public virtual bool IsAlive => weakReference.IsAlive;

            internal virtual void Renew(TValue value) => weakReference.Target = value;

            protected readonly WeakReference weakReference;
        }

        private class LeasedReference : Reference
        {
            public override TValue Target
            {
                get
                {
                    RenewLease();
                    if (strongReference == null) return (TValue) weakReference.Target;
                    return strongReference;
                }
            }

            public override bool IsAlive => strongReference != null || base.IsAlive;

            public LeasedReference(TValue value, TimeSpan Lease) : base(value)
            {
                strongReference = value;
                lease = Lease;
                expiration = DateTime.Now + Lease;
                ScheduleExpirationCheck();
            }

            private void ScheduleExpirationCheck()
            {
                var span = TimeSpan.FromMilliseconds((1 + 0.2 * r.NextDouble()) * lease.TotalMilliseconds + 20);
                CcrService.Singleton.Delay(span, CheckExpiration);
            }

            private void CheckExpiration()
            {
                lock (weakReference)
                {
                    if (expiration - DateTime.Now <= TimeSpan.Zero)
                        strongReference = default(TValue);
                    else
                        ScheduleExpirationCheck();
                }
            }

            private void RenewLease()
            {
                var target = weakReference.Target;
                if (target == null) return;
                var t = DateTime.Now - lease;
                lock (weakReference)
                {
                    if (t > expiration)
                        expiration = t;
                    if (strongReference == null)
                    {
                        strongReference = (TValue) target;
                        ScheduleExpirationCheck();
                    }
                }
            }

            internal override void Renew(TValue value)
            {
                base.Renew(value);
                strongReference = value;
                RenewLease();
            }

            private TValue strongReference;
            private DateTime expiration;
            private readonly TimeSpan lease;
            private readonly Random r = new Random();
        }

        public delegate TValue Getter(TKey key);
        
        public class Configuration
        {
            public Configuration(string name) => Name = name;
            
            public TimeSpan Lease = TimeSpan.Zero;

            public Getter Getter;
            
            public TimeSpan PurgeFrequency = TimeSpan.FromSeconds(15);

            public readonly string Name;
        }
    }
}
