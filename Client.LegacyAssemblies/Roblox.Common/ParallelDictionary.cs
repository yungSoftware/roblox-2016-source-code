using System;
using System.Collections.Generic;
using Microsoft.Ccr.Core;

namespace Roblox
{
    public interface IAsyncDictionary<TKey, TValue>
    {
        void Add(TKey key, TValue value, Port<EmptyValue> result);
        void ContainsKey(TKey key, Port<bool> result);
        void Remove(TKey key, Port<bool> result);
        void TryGetValue(TKey key, PortSet<TValue, EmptyValue> result);
        void GetOrCreate(TKey key, Port<TValue> result);
    }

    public class AsyncDictionary<TKey, TValue> : IAsyncDictionary<TKey, TValue>
        where TValue : new()
    {
        private readonly Interleaver interleaver = new Interleaver();
        private readonly IDictionary<TKey, TValue> dictionary = new Dictionary<TKey, TValue>();

        public void Add(TKey key, TValue value, Port<EmptyValue> result)
        {
            interleaver.DoExclusive(() =>
            {
                dictionary.Add(key, value);
                result.Post(EmptyValue.SharedInstance);
            });
        }
        public void GetOrCreate(TKey key, Port<TValue> result)
        {
            interleaver.DoExclusive(() =>
            {
                if (!dictionary.TryGetValue(key, out var value))
                {
                    value = new TValue();
                    dictionary.Add(key, value);
                }
                result.Post(value);
            });
        }
        public void ContainsKey(TKey key, Port<bool> result)
        {
            interleaver.DoConcurrent(() => result.Post(dictionary.ContainsKey(key)));
        }
        public void Remove(TKey key, Port<bool> result)
        {
            interleaver.DoExclusive(() => result.Post(dictionary.Remove(key)));
        }
        public void TryGetValue(TKey key, PortSet<TValue, EmptyValue> result)
        {
            interleaver.DoConcurrent(() =>
            {
                if (dictionary.TryGetValue(key, out var value))
                {
                    result.Post(value);
                    return;
                }
                result.Post(EmptyValue.SharedInstance);
            });
        }
    }

    public class ParallelDictionary<TKey, TValue> : IAsyncDictionary<TKey, TValue>
        where TValue : new()
    {
        private readonly AsyncDictionary<TKey, TValue>[] dictionaries = new AsyncDictionary<TKey, TValue>[64];

        public ParallelDictionary()
        {
            for (int i = 0; i < dictionaries.Length; i++)
                dictionaries[i] = new AsyncDictionary<TKey, TValue>();
        }

        private AsyncDictionary<TKey, TValue> GetDictionary(TKey key)
        {
            var hashCode = (uint)key.GetHashCode();
            return dictionaries[(int)checked((IntPtr)(unchecked(hashCode % (ulong)dictionaries.Length)))];
        }
        public void Add(TKey key, TValue value, Port<EmptyValue> result) { GetDictionary(key).Add(key, value, result); }
        public void ContainsKey(TKey key, Port<bool> result) { GetDictionary(key).ContainsKey(key, result); }
        public void Remove(TKey key, Port<bool> result) { GetDictionary(key).Remove(key, result); }
        public void TryGetValue(TKey key, PortSet<TValue, EmptyValue> result) { GetDictionary(key).TryGetValue(key, result); }
        public void GetOrCreate(TKey key, Port<TValue> result) { GetDictionary(key).GetOrCreate(key, result); }
    }
}
