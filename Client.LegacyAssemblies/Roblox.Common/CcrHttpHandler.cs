using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.Web;
using Microsoft.Ccr.Core;
using Roblox.Common;

namespace Roblox.Ccr
{
    public abstract class HttpHandler : IHttpAsyncHandler, IHttpHandler
    {
        static HttpHandler()
        {
            new Thread(MonitorPerformance) 
                { IsBackground = true, Name = "Performance Monitor: Ccr.HttpHandler" }
                .Start();
        }

        protected abstract IEnumerator<ITask> Execute(HttpContext context);

        protected virtual bool SynchronousExecute(HttpContext context) => false;

        private IEnumerator<ITask> ExecuteAndComplete(HttpContext context, FastAsyncResult result)
        {
            IEnumerator<ITask> enu;
            try
            {
                enu = Execute(context);
            }
            catch (Exception completed)
            {
                result.SetCompleted(completed);
                yield break;
            }

            using (enu)
            {
                for (;;)
                {
                    try
                    {
                        if (!enu.MoveNext())
                        {
                            result.SetCompleted();
                            yield break;
                        }
                    }
                    catch (Exception completed)
                    {
                        result.SetCompleted(completed);
                        yield break;
                    }

                    yield return enu.Current;
                }
            }
        }

        private static void MonitorPerformance()
        {
            try
            {
                var categoryName = "Roblox Ccr.HttpHandler";
                if (!PerformanceCounterCategory.Exists(categoryName))
                {
                    var counterCreationDataCollection = new CounterCreationDataCollection();
                    counterCreationDataCollection.Add(new CounterCreationData("Pending Async Calls", string.Empty,
                        PerformanceCounterType.NumberOfItems64));
                    PerformanceCounterCategory.Create(categoryName, string.Empty,
                        PerformanceCounterCategoryType.SingleInstance, counterCreationDataCollection);
                }

                var perfPendingAsyncCalls = new PerformanceCounter(categoryName, "Pending Async Calls", false);
                while (true)
                {
                    perfPendingAsyncCalls.RawValue = _PendingAsyncCalls;
                    Thread.Sleep(500);
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

        public IAsyncResult BeginProcessRequest(HttpContext context, AsyncCallback cb, object extraData)
        {
            if (SynchronousExecute(context))
                return new SynchronousCompletionAsyncResult(cb, extraData);
            Interlocked.Increment(ref _PendingAsyncCalls);

            var asyncResult = new FastAsyncResult(cb, extraData);
            CcrService.Singleton.SpawnIterator(context, asyncResult, ExecuteAndComplete);
            return asyncResult;
        }

        public void EndProcessRequest(IAsyncResult result)
        {
            var fastResult = result as FastAsyncResult;

            if (fastResult != null)
            {
                var error = fastResult.Error;
                fastResult.Dispose();
                Interlocked.Decrement(ref _PendingAsyncCalls);
                if (error != null) throw new ApplicationException("Roblox.Ccr.HttpHandler Error", error);
            }
        }
        
        public abstract bool IsReusable { get; }

        public void ProcessRequest(HttpContext context) => throw new NotImplementedException();

        private static long _PendingAsyncCalls;
    }
}
