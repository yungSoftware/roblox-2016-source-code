using System;
using System.Diagnostics;
using System.Threading;
using Microsoft.Ccr.Core;

namespace Roblox
{
    public class CcrService : CcrServiceBase, IDisposable
    {
        private Ccr.DispatcherMonitor _Monitor;

        public new DispatcherQueue TaskQueue
        {
            get { return base.TaskQueue; }
        }

        public static readonly CcrService Singleton = new CcrService(false);

        private CcrService(bool monitor)
            : base(new PatchedDispatcherQueue("Roblox CcrService", new Dispatcher(0, ThreadPriority.Normal, DispatcherOptions.UseBackgroundThreads, "Roblox CcrService")))
        {
            if (monitor)
                _Monitor = new Ccr.DispatcherMonitor(TaskQueue.Dispatcher);

            var performanceMonitor = new Thread(MonitorPerformance);
            performanceMonitor.IsBackground = true;
            performanceMonitor.Name = "Performance Monitor: CcrService";
            performanceMonitor.Start();
        }

        private void MonitorPerformance()
        {
            try
            {
                string performanceCategory = "Roblox CcrService";

                if (!PerformanceCounterCategory.Exists(performanceCategory))
                {
                    CounterCreationDataCollection collection = new CounterCreationDataCollection();
                    collection.Add(new CounterCreationData("TaskQueue Count", string.Empty, PerformanceCounterType.NumberOfItems32));
                    collection.Add(new CounterCreationData("TaskQueue CurrentSchedulingRate", string.Empty, PerformanceCounterType.RateOfCountsPerSecond64));
                    collection.Add(new CounterCreationData("TaskQueue ScheduledTaskCount", string.Empty, PerformanceCounterType.NumberOfItems64));
                    collection.Add(new CounterCreationData("Dispatcher PendingTaskCount", string.Empty, PerformanceCounterType.NumberOfItems32));
                    collection.Add(new CounterCreationData("Dispatcher ProcessedTaskCount", string.Empty, PerformanceCounterType.NumberOfItems64));
                    collection.Add(new CounterCreationData("Dispatcher WorkerThreadCount", string.Empty, PerformanceCounterType.NumberOfItems32));
                    PerformanceCounterCategory.Create(performanceCategory, string.Empty, PerformanceCounterCategoryType.SingleInstance, collection);
                }
                PerformanceCounter perfQueueCount = new PerformanceCounter(performanceCategory, "TaskQueue Count", false);
                PerformanceCounter perfCurrentSchedulingRate = new PerformanceCounter(performanceCategory, "TaskQueue CurrentSchedulingRate", false);
                PerformanceCounter perfScheduledTaskCount = new PerformanceCounter(performanceCategory, "TaskQueue ScheduledTaskCount", false);
                PerformanceCounter perfPendingTaskCount = new PerformanceCounter(performanceCategory, "Dispatcher PendingTaskCount", false);
                PerformanceCounter perfProcessdTaskCount = new PerformanceCounter(performanceCategory, "Dispatcher ProcessedTaskCount", false);
                PerformanceCounter perfWorkerThreadCount = new PerformanceCounter(performanceCategory, "Dispatcher WorkerThreadCount", false);

                long scheduledTaskCount = this.TaskQueue.ScheduledTaskCount;
                while (true)
                {
                    perfQueueCount.RawValue = this.TaskQueue.Count;
                    {
                        long count = this.TaskQueue.ScheduledTaskCount;
                        perfCurrentSchedulingRate.IncrementBy(count - scheduledTaskCount);
                        scheduledTaskCount = count;
                    }
                    perfScheduledTaskCount.RawValue = scheduledTaskCount;
                    perfPendingTaskCount.RawValue = this.TaskQueue.Dispatcher.PendingTaskCount;
                    perfProcessdTaskCount.RawValue = this.TaskQueue.Dispatcher.ProcessedTaskCount;
                    perfWorkerThreadCount.RawValue = this.TaskQueue.Dispatcher.WorkerThreadCount;
                    Thread.Sleep(500);
                }
            } 
            catch(ThreadAbortException)
            {
            }
            catch (Exception ex)
            {
                ExceptionHandler.LogException(ex);
            }
        }

        public bool BlockUntilCompletion(ITask task, TimeSpan timeout)
        {
            // TODO: Pool these handles for better performance.
            using (var handle = new EventWaitHandle(false, EventResetMode.ManualReset))
            {
                var donePort = new Port<EmptyValue>();
                Arbiter.ExecuteToCompletion(TaskQueue, task, donePort);
                Activate(
                    Arbiter.Receive(
                        false,
                        donePort,
                        (e) => handle.Set()
                    )
                );
                return handle.WaitOne(timeout);
            }
        }

        public SuccessFailurePort Choice(Action<SuccessResult> successHandler, Action<Exception> failureHandler)
        {
            var result = new SuccessFailurePort();
            Choice<SuccessResult, Exception>(result, successHandler, failureHandler);
            return result;
        }

        public PortSet<T0, T1> Choice<T0, T1>(Action<T0> handler0, Action<T1> handler1)
        {
            var result = new PortSet<T0, T1>();
            Choice<T0, T1>(result, handler0, handler1);
            return result;
        }

        public void Choice<T0, T1>(PortSet<T0, T1> resultPortSet, Action<T0> handler0, Action<T1> handler1)
        {
            var choice = Arbiter.Choice(
                resultPortSet,
                (result0) =>
                {
                    try
                    {
                        handler0(result0);
                    }
                    catch (Exception ex)
                    {
                        ExceptionHandler.LogException(ex);
                    }
                },
                (result1) =>
                {
                    try
                    {
                        handler1(result1);
                    }
                    catch (Exception ex)
                    {
                        ExceptionHandler.LogException(ex);
                    }
                }
            );
            CcrService.Singleton.Activate(choice);
        }
        public void Choice<T>(PortSet<T, Exception> resultPortSet, Action<T> successHandler)
        {
            Choice<T, Exception>(
                resultPortSet,
                successHandler,
                ExceptionHandler.LogException
            );
        }
        public void Delay(TimeSpan timeSpan, Handler handler)
        {
            var timeoutPort = TimeoutPort(timeSpan);
            var receiver = Arbiter.Receive(false, timeoutPort, (time) => handler());
            Activate(receiver);
        }
        public void DelayInterator(TimeSpan timeSpan, IteratorHandler handler)
        {
            var timeoutPort = TimeoutPort(timeSpan);
            var receiver = Arbiter.Receive(false, timeoutPort, (time) => SpawnIterator(handler));
            Activate(receiver);
        }
        public ITask ExecuteToCompletion(IteratorHandler handler)
        {
            // The bool ensures that causalties are propagated
            return Arbiter.ExecuteToCompletion(
                TaskQueue,
                new IterativeTask<bool>(
                    true,
                    (notUsed) => handler()
                 )
            );
        }
        public ITask NestIterator(IteratorHandler handler)
        {
            return Arbiter.ExecuteToCompletion(
                base.TaskQueue,
                Arbiter.FromIteratorHandler(handler)
            );
        }
        public Port<T> Receive<T>(bool persist, Action<T> handler)
        {
            var result = new Port<T>();
            Receive<T>(persist, result, handler);
            return result;
        }
        public void Receive<T>(bool persist, Port<T> result, Action<T> handler)
        {
            var receiver = Arbiter.Receive<T>(
                persist,
                result,
                (t) =>
                {
                    try
                    {
                        handler(t);
                    }
                    catch (Exception ex)
                    {
                        ExceptionHandler.LogException(ex);
                    }
                }
            );
            Activate(receiver);
        }
        /// <summary>
        /// Exposes the Spawn function for client with Causalties
        /// </summary>
        public new void Spawn(Handler handler)
        {
            var task = new Task<bool>(true, (notUsed) => handler());
            TaskQueue.Enqueue(task);
        }
        /// <summary>
        /// Exposes the SpawnIterator function for clients
        /// </summary>
        public new void SpawnIterator(IteratorHandler handler)
        {
            var iterativeTask = new IterativeTask<bool>(true, (notUsed) => handler());
            TaskQueue.Enqueue(iterativeTask);
        }
        public new void SpawnIterator<T0>(T0 t0, IteratorHandler<T0> handler)
        {
            var iterativeTask = new IterativeTask<bool>(true, (notUsed) => handler(t0));
            TaskQueue.Enqueue(iterativeTask);
        }
        public new void SpawnIterator<T0, T1>(T0 t0, T1 t1, IteratorHandler<T0, T1> handler)
        {
            var iterativeTask = new IterativeTask<bool>(true, (notUsed) => handler(t0, t1));
            TaskQueue.Enqueue(iterativeTask);
        }
        public new void SpawnIterator<T0, T1, T2>(T0 t0, T1 t1, T2 t2, IteratorHandler<T0, T1, T2> handler)
        {
            var iterativeTask = new IterativeTask<bool>(true, (notUsed) => handler(t0, t1, t2));
            TaskQueue.Enqueue(iterativeTask);
        }
        public new Port<DateTime> TimeoutPort(TimeSpan ts)
        {
            return base.TimeoutPort(ts);
        }
        public ITask Wait(TimeSpan ts)
        {
            return base.TimeoutPort(ts).Receive();
        }


        #region IDisposable Members
        
        public void Dispose()
        {
            if (_Monitor != null)
                _Monitor.Dispose();

            TaskQueue.Dispose();

            base.TaskQueue.Dispose();
        }

        #endregion

    }
}
