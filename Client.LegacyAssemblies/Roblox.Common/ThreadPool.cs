using System;
using System.Diagnostics;
using System.Threading;
using Microsoft.Ccr.Core;

namespace Roblox.Common
{
    public sealed class CustomThreadPool : IDisposable
    {
        public delegate void WorkItem();

        private class WaitQueueItem
        {
            public WaitCallback Callback;
            public ExecutionContext Context;
            public object State;
        }

        private Dispatcher _Dispatcher;
        private DispatcherQueue _DispatcherQueue;
        private static readonly string _PerformanceCategory = "Roblox.CustomThreadPool";
        private readonly Port<WaitQueueItem> _WaitQueueItemsPort = new Port<WaitQueueItem>();

        public CustomThreadPool(string name, int threadCount)
        {
            _Dispatcher = new Dispatcher(threadCount, ThreadPriority.Normal, DispatcherOptions.UseBackgroundThreads, string.Format("{0} Dispatcher", name));
            _DispatcherQueue = new PatchedDispatcherQueue(string.Format("{0} Dispatcher Queue", name), _Dispatcher);
            Arbiter.Activate(_DispatcherQueue, Arbiter.Receive(true, _WaitQueueItemsPort, ExecuteWorkItem));
            new Thread(() => MonitorPerformance(name)) { IsBackground = true, Name = string.Format("Performance Monitor: {0}", name) }.Start();
        }

        public int QueueCount { get { CheckDisposed(); return _DispatcherQueue.Count; } }
        public int PendingTaskCount { get { CheckDisposed(); return _DispatcherQueue.Dispatcher.PendingTaskCount; } }
        public long ProcessedTaskCount { get { CheckDisposed(); return _DispatcherQueue.Dispatcher.ProcessedTaskCount; } }
        public int WorkerThreadCount { get { CheckDisposed(); return _DispatcherQueue.Dispatcher.WorkerThreadCount; } }

        private void CheckDisposed() { if (_DispatcherQueue == null) throw new ObjectDisposedException(GetType().Name); }
        private void ExecuteWorkItem(WaitQueueItem item)
        {
            try { ExecutionContext.Run(item.Context, item.Callback.Invoke, item.State); }
            catch (ThreadAbortException) {}
            catch (ThreadInterruptedException) {}
            catch (Exception ex) { ExceptionHandler.LogException(ex); }
        }
        private void MonitorPerformance(string instanceName)
        {
            try
            {
                if (!PerformanceCounterCategory.Exists(_PerformanceCategory))
                {
                    var collection = new CounterCreationDataCollection();
                    collection.Add(new CounterCreationData("Dispatcher Queue Count", string.Empty, PerformanceCounterType.NumberOfItems32));
                    collection.Add(new CounterCreationData("Dispatcher Queue Current Scheduling Rate", string.Empty, PerformanceCounterType.RateOfCountsPerSecond64));
                    collection.Add(new CounterCreationData("Dispatcher Queue Scheduled Task Count", string.Empty, PerformanceCounterType.NumberOfItems64));
                    collection.Add(new CounterCreationData("Dispatcher Pending Task Count", string.Empty, PerformanceCounterType.NumberOfItems32));
                    collection.Add(new CounterCreationData("Dispatcher Processed Task Count", string.Empty, PerformanceCounterType.NumberOfItems64));
                    collection.Add(new CounterCreationData("Dispatcher Worker Thread Count", string.Empty, PerformanceCounterType.NumberOfItems32));
                    PerformanceCounterCategory.Create(_PerformanceCategory, string.Empty, PerformanceCounterCategoryType.SingleInstance, collection);
                }

                var perfDispatcherQueueCount = new PerformanceCounter(_PerformanceCategory, "Dispatcher Queue Count", false);
                var perfDispatcherQueueCurrentSchedulingRate = new PerformanceCounter(_PerformanceCategory, "Dispatcher Queue Current Scheduling Rate", false);
                var perfDispatcherQueueScheduledTaskCount = new PerformanceCounter(_PerformanceCategory, "Dispatcher Queue Scheduled Task Count", false);
                var perfDispatcherPendingTaskCount = new PerformanceCounter(_PerformanceCategory, "Dispatcher Pending Task Count", false);
                var perfDispatcherProcessedTaskCount = new PerformanceCounter(_PerformanceCategory, "Dispatcher Processed Task Count", false);
                var perfDispatcherWorkerThreadCount = new PerformanceCounter(_PerformanceCategory, "Dispatcher Worker Thread Count", false);
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
                    Thread.Sleep(500);
                }
            }
            catch (ThreadAbortException) {}
            catch (Exception ex) { ExceptionHandler.LogException(ex); }
        }
        public void Dispose()
        {
            _DispatcherQueue?.Dispose();
            _DispatcherQueue = null;
            _Dispatcher?.Dispose();
            _Dispatcher = null;
        }
        public void QueueUserWorkItem(WaitCallback callback)
            => QueueUserWorkItem(callback, null);
        public void QueueUserWorkItem(WaitCallback callback, object state)
        {
            CheckDisposed();
            if (callback == null) throw new ArgumentNullException(nameof(callback));
            var item = new WaitQueueItem();
            item.Callback = callback;
            item.State = state;
            item.Context = ExecutionContext.Capture();
            _WaitQueueItemsPort.Post(item);
        }
    }
}
