using System;
using System.Threading;
using System.Diagnostics;

namespace Roblox.Common
{
    public class ObjectCounter<T>
    {
        private class Count
        {
            private static readonly string perfCategory = "Roblox.Common.ObjectCounter";
            private readonly PerformanceCounter perfItemCount;
            private readonly PerformanceCounter perfCollectRate;

            public Count()
            {
                if (!PerformanceCounterCategory.Exists(perfCategory))
                {
                    var counterCreationDataCollection = new CounterCreationDataCollection();
                    counterCreationDataCollection.Add(new CounterCreationData("Count", string.Empty, PerformanceCounterType.NumberOfItems32));
                    counterCreationDataCollection.Add(new CounterCreationData("Collect Rate", string.Empty, PerformanceCounterType.RateOfCountsPerSecond32));
                    PerformanceCounterCategory.Create(perfCategory, string.Empty, PerformanceCounterCategoryType.MultiInstance, counterCreationDataCollection);
                }
                var typeName = typeof(T).Name;
                Console.WriteLine(string.Format("ObjectCounter name: {0}", typeName));
                perfItemCount = new PerformanceCounter(perfCategory, "Count", false);
                perfItemCount.RawValue = 0;
                perfCollectRate = new PerformanceCounter(perfCategory, "Collect Rate", false);
            }

            internal void Increment() { perfItemCount.Increment(); }
            internal void Decrement()
            {
                perfItemCount.Decrement();
                perfCollectRate.Increment();
            }
        }

        private static readonly Count count = new Count();

        public ObjectCounter() { count.Increment(); }
        ~ObjectCounter() { count.Decrement(); }
    }

    public class EventCounter : IDisposable
    {
        private class Bucket
        {
            private long eventCount;

            public long EventCount { get { return eventCount; } }

            public Bucket(long value) { eventCount = value; }

            public void LogEvent() { Interlocked.Increment(ref eventCount); }
        }

        private class BucketAggregation
        {
            private Bucket current;
            private BucketAggregation next;
            public readonly TimeSpan Span;

            public BucketAggregation(TimeSpan span) { Span = span; }

            public void AddBucket(Bucket bucket)
            {
                if (current == null)
                {
                    current = bucket;
                    return;
                }

                if (next == null) next = new BucketAggregation(Span.Add(Span));

                next.AddBucket(new Bucket(current.EventCount + bucket.EventCount));
                current = null;
            }
            public long GetEventCount(TimeSpan span)
            {
                if (current != null)
                {
                    if (span == Span) return current.EventCount;
                    if (span > Span && next != null) return current.EventCount + next.GetEventCount(span.Subtract(Span));
                    return current.EventCount * span.Ticks / span.Ticks;
                }

                if (next != null) return next.GetEventCount(span);
                return 0;
            }
            public long GetTotalEventCount()
            {
                var eventCount = 0L;
                if (current != null) eventCount += current.EventCount;
                if (next != null) eventCount += next.GetTotalEventCount();
                return eventCount;
            }
        }

        private Bucket currentBucket;
        private readonly BucketAggregation head = new BucketAggregation(SmallestInterval);
        private readonly Timer timer;
        public static readonly TimeSpan SmallestInterval = TimeSpan.FromSeconds(2);

        public EventCounter()
        {
            currentBucket = new Bucket(0);
            timer = new Timer(
                dummyValue =>
                {
                    head.AddBucket(currentBucket);
                    currentBucket = new Bucket(0);
                },
                null,
                SmallestInterval,
                SmallestInterval
            );
        }

        public long GetEventCount(TimeSpan sample)
        {
            if (sample == TimeSpan.MaxValue) return GetTotalEventCount();
            return head.GetEventCount(sample);
        }
        public double GetEventsPerSecond(TimeSpan sample)
        {
            var eventCount = GetEventCount(sample);
            if (sample == TimeSpan.Zero) return 0;
            return eventCount / sample.TotalSeconds;
        }
        public long GetTotalEventCount() { return head.GetTotalEventCount(); }
        public void LogEvent() { currentBucket.LogEvent(); }
        public void Dispose() { timer.Dispose(); }
    }
}
