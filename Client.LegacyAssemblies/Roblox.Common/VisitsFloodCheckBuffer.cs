using System;
using System.Collections;
using System.Collections.Generic;

namespace Roblox.Common
{
    public class VisitsFloodCheckBuffer : IDisposable
    {
        private VisitsFloodCheckBuffer()
        {
            var configuration =
                new ObjectRegistry<int, IDictionary<long, DateTime>>.Configuration("VisitsFloodCheckBuffer");
            configuration.Lease = floodCheckInterval;
            configuration.Getter = k => new Dictionary<long, DateTime>();
            configuration.PurgeFrequency = TimeSpan.FromMinutes(5);
            userLogs = new ObjectRegistry<int, IDictionary<long, DateTime>>(configuration);
        }

        public bool PassesFloodCheck(int userId, long placeId)
        {
            if (!userLogs.TryGetValue(userId, out var log)) return true;
            var sync = log;
            lock (sync)
            {
                if (log == null) return true;
                return !log.TryGetValue(placeId, out var minValue) || minValue == DateTime.MinValue || DateTime.Now.Subtract(minValue) > floodCheckInterval;
            }
        }

        public bool RegisterVisit(int userId, long placeId)
        {
            var now = DateTime.Now;
            var dict = userLogs.Get(userId);
            var sync = dict;
            var item = new KeyValuePair<long, DateTime>(placeId, now);
            
            lock (sync)
            {
                if (dict.TryGetValue(placeId, out var minValue))
                {
                    if (now.Subtract(minValue) > floodCheckInterval)
                        dict.Remove(placeId);
                    else
                    {
                        dict.Remove(placeId);
                        dict.Add(new KeyValuePair<Int64, DateTime>(placeId, DateTime.MinValue));
                        return false;
                    }

                }
                dict.Add(item);
                return true;
            }
        }

        public void Dispose() => userLogs.Dispose();

        private readonly ObjectRegistry<int, IDictionary<long, DateTime>> userLogs;
        private static readonly TimeSpan floodCheckInterval = TimeSpan.FromHours(1);
        public static readonly VisitsFloodCheckBuffer Singleton = new VisitsFloodCheckBuffer();
    }
}
