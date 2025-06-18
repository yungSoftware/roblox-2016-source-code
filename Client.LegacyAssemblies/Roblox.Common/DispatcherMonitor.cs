using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using Microsoft.Ccr.Core;

namespace Roblox.Ccr
{
    /// <summary>
    /// Used for debugging Dispatcher problems
    /// </summary>
    public class DispatcherMonitor : IDisposable
    {
        readonly Dispatcher dispatcher;
        readonly ICollection<Thread> threads = new HashSet<Thread>();
        Thread thread;

        public DispatcherMonitor(Dispatcher dispatcher)
        {
            this.dispatcher = dispatcher;
            GatherWorkerThreads();
            dispatcher.UnhandledException += new UnhandledExceptionEventHandler(dispatcher_UnhandledException);

            thread = new Thread(Monitor);
            thread.IsBackground = true;
            thread.Name = "DispatcherMonitor: " + dispatcher.Name;
            thread.Start();
        }

        void dispatcher_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            ExceptionHandler.LogException(new ApplicationException(string.Format("{0} had an unhandled exception", dispatcher.Name), e.ExceptionObject as Exception));
        }

        void Monitor()
        {
            int count = 0;
            const int iterations = 4;
            TimeSpan sleep = TimeSpan.Zero;
            while (true)
            {
                try
                {
                    var pendingTaskCount = dispatcher.PendingTaskCount;

                    var trigger = Roblox.Common.Properties.Settings.Default.CcrServiceBacklogTrigger;

                    if (trigger <= 0)
                        sleep = TimeSpan.FromSeconds(10);
                    else if (pendingTaskCount > trigger)
                    {
                        count++;
                        if (count >= iterations)
                        {
                            ReportBacklog(pendingTaskCount);
                            sleep = TimeSpan.FromMinutes(1);
                        }
                    }
                    else
                        count = 0;

                }
                catch (ThreadAbortException)
                {
                    return;
                }
                catch (Exception ex)
                {
                    ExceptionHandler.LogException(ex);
                }

                if (sleep != TimeSpan.Zero)
                {
                    System.Threading.Thread.Sleep(sleep);
                    sleep = TimeSpan.Zero;
                }
                else
                {
                    var wait = Roblox.Common.Properties.Settings.Default.CcrServiceBacklogTriggerInterval;
                    if (wait != TimeSpan.Zero)
                        System.Threading.Thread.Sleep((int)(wait.TotalMilliseconds / iterations));
                    else
                        System.Threading.Thread.Sleep(TimeSpan.FromSeconds(10));
                }
            }
        }

        private void GatherWorkerThreads()
        {
            // Grab all the threads for debugging!
            // TODO: Make this more robust. It's pretty kludgy
            int count = 2 * dispatcher.WorkerThreadCount;
            for (int i = 0; i < 2 * dispatcher.WorkerThreadCount; ++i)
                dispatcher.DispatcherQueues[0].Enqueue
                (Arbiter.FromHandler(() =>
                {
                    System.Threading.Thread.Sleep(200);
                    lock (threads)
                        threads.Add(System.Threading.Thread.CurrentThread);
                    System.Threading.Interlocked.Decrement(ref count);
                }));

            while (count > 0)
                System.Threading.Thread.Sleep(10);
        }

        /// <summary>
        /// For debugging only!
        /// </summary>
        /// <returns></returns>
        private IEnumerable<StackTrace> GetWorkerStacks()
        {
            foreach (var t in threads)
            {
                StackTrace trace;
#pragma warning disable 0618
                t.Suspend();
                try
                {
                    trace = new System.Diagnostics.StackTrace(t, true);
                }
                catch (Exception)
                {
                    continue;
                }
                finally
                {
                    t.Resume();
                }
#pragma warning restore 0618
                yield return trace;
            }
        }

        private void ReportBacklog(int pendingTasks)
        {
            string message = string.Format("CcrService detected a backlog of {0}. These are the currently running tasks:\r\n\r\n", pendingTasks);
            foreach (var trace in GetWorkerStacks())
                message += trace.ToString() + "\r\n\r\n";
            ExceptionHandler.LogException(message, EventLogEntryType.Warning, 4061);
        }


        #region IDisposable Members
        public void Dispose()
        {
            if (dispatcher != null)
                dispatcher.Dispose();

            threads.Clear();
        }
        #endregion
    }
}
