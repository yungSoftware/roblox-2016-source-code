using System;
using System.Diagnostics;
using System.Threading;
using Microsoft.Ccr.Core;

namespace Roblox.Common
{
    public class FileHelper : IDisposable
    {
        private FileHelper() {}

        static FileHelper()
        {
            new Thread(MonitorPerformance)
            {
                IsBackground = true,
                Name = "Performance Monitor: FileHelper"
            }.Start();

            for (int i = 0; i < _DefaultPoolSize; i++)
                AddToPool();
        }

        public static void ExecuteTask<TResult>(Func<TResult> func, PortSet<TResult, Exception> result)
        {
            var port = new Port<FileHelper>();
            Get(port);
            CcrService.Singleton.Activate(
                Arbiter.Receive(false, port, (fh) =>
                {
                    try
                    {
                        result.Post(func());
                    }
                    catch (Exception ex)
                    {
                        result.Post(ex);
                    }
                    finally
                    {
                        fh.Dispose();
                    }
                })    
            );
        }
        
        public static void ExecuteTask<Arg0, TResult>(Func<Arg0, TResult> func, Arg0 arg0, PortSet<TResult, Exception> result)
        {
            var port = new Port<FileHelper>();
            Get(port);
            CcrService.Singleton.Activate(
                Arbiter.Receive(false, port, (fh) =>
                {
                    try
                    {
                        result.Post(func(arg0));
                    }
                    catch (Exception ex)
                    {
                        result.Post(ex);
                    }
                    finally
                    {
                        fh.Dispose();
                    }
                })    
            );
        }

        public static void AddToPool()
        {
            _Pool.Post(new FileHelper());
        }

        private static void Get(Port<FileHelper> result) =>
            Arbiter.Activate(_DispatcherQueue, Arbiter.Receive(false, _Pool, (h) => result.Post(h)));

        private static void MonitorPerformance()
        {
            try
            {
                var categoryName = "Roblox FileHelper";
                if (!PerformanceCounterCategory.Exists(categoryName))
                {
                    var collection = new CounterCreationDataCollection();
                    collection.Add(new CounterCreationData("Dispatcher Queue Count", string.Empty,
                        PerformanceCounterType.NumberOfItems32));
                    collection.Add(new CounterCreationData("Dispatcher Queue Current Scheduling Rate", string.Empty,
                        PerformanceCounterType.RateOfCountsPerSecond64));
                    collection.Add(new CounterCreationData("Dispatcher Queue Scheduled Task Count", string.Empty,
                        PerformanceCounterType.NumberOfItems64));
                    collection.Add(new CounterCreationData("Dispatcher Pending Task Count", string.Empty,
                        PerformanceCounterType.NumberOfItems32));
                    collection.Add(new CounterCreationData("Dispatcher Processed Task Count", string.Empty,
                        PerformanceCounterType.NumberOfItems64));
                    collection.Add(new CounterCreationData("Dispatcher Worker Thread Count", string.Empty,
                        PerformanceCounterType.NumberOfItems32));
                    PerformanceCounterCategory.Create(categoryName, string.Empty,
                        PerformanceCounterCategoryType.SingleInstance, collection);
                }

                var perfDispatcherQueueCount = new PerformanceCounter(categoryName, "Dispatcher Queue Count", false);
                var perfDispatcherQueueCurrentSchedulingRate = new PerformanceCounter(categoryName,
                    "Dispatcher Queue Current Scheduling Rate", false);
                var perfDispatcherQueueScheduledTaskCount =
                    new PerformanceCounter(categoryName, "Dispatcher Queue Scheduled Task Count", false);
                var perfDispatcherPendingTaskCount =
                    new PerformanceCounter(categoryName, "Dispatcher Pending Task Count", false);
                var perfDispatcherProcessedTaskCount =
                    new PerformanceCounter(categoryName, "Dispatcher Processed Task Count", false);
                var perfDispatcherWorkerThreadCount =
                    new PerformanceCounter(categoryName, "Dispatcher Worker Thread Count", false);
                var num = _DispatcherQueue.ScheduledTaskCount;

                while (true)
                {
                    perfDispatcherQueueCount.RawValue = _DispatcherQueue.Count;
                    var scheduledTaskCount = _DispatcherQueue.ScheduledTaskCount;
                    perfDispatcherQueueCurrentSchedulingRate.IncrementBy(scheduledTaskCount - num);
                    num = scheduledTaskCount;
                    perfDispatcherQueueScheduledTaskCount.RawValue = num;
                    perfDispatcherPendingTaskCount.RawValue = _DispatcherQueue.Dispatcher.PendingTaskCount;
                    perfDispatcherProcessedTaskCount.RawValue = _DispatcherQueue.Dispatcher.ProcessedTaskCount;
                    perfDispatcherWorkerThreadCount.RawValue = _DispatcherQueue.Dispatcher.WorkerThreadCount;
                }
            }
            catch (ThreadAbortException)
            {
            }
            catch (Exception ex)
            {
                ExceptionHandler.LogException(ex);
            }
        }

        public void Dispose() => AddToPool();

        private static readonly int _DefaultPoolSize = 25;

        private static readonly DispatcherQueue _DispatcherQueue = new PatchedDispatcherQueue("Roblox FileHelper",
            new Dispatcher(0, ThreadPriority.Normal, DispatcherOptions.UseBackgroundThreads, "Roblox FileHelper"));

        private static readonly Port<FileHelper> _Pool = new Port<FileHelper>();
    }
}
