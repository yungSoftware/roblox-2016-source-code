using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.Web.Services.Protocols;
using Microsoft.Ccr.Core;

namespace Roblox.Common
{
    public class AsyncHelper
    {
        private struct AsyncLookupItem<T0, T1>
        {
            public int Index;
            public T0 Key;
            public PortSet<T1, Exception> Result;

            public AsyncLookupItem(int index, T0 key, PortSet<T1, Exception> result)
            {
                Index = index;
                Key = key;
                Result = result;
            }
        }

        static readonly string performanceCategory = "Roblox.AsyncHelper";
        static readonly PerformanceCounter perfTotalAsyncCalls;
        static readonly PerformanceCounter timeoutCounts;
        static readonly PerformanceCounter riskyTimeoutCounts;
        static readonly PerformanceCounter perfPendingAsyncCallsCount;

        static AsyncHelper()
        {
            if (!PerformanceCounterCategory.Exists(performanceCategory))
            {
                var collection = new CounterCreationDataCollection();
                collection.Add(new CounterCreationData("Pending Async Calls", string.Empty, PerformanceCounterType.NumberOfItems64));
                collection.Add(new CounterCreationData("Total Async Calls", string.Empty, PerformanceCounterType.NumberOfItems64));
                collection.Add(new CounterCreationData("Timeouts", string.Empty, PerformanceCounterType.NumberOfItems64));
                collection.Add(new CounterCreationData("Risky Timeouts", string.Empty, PerformanceCounterType.NumberOfItems64));
                //collection.Add(new CounterCreationData("Async Call Rate", string.Empty, PerformanceCounterType.RateOfCountsPerSecond64));
                PerformanceCounterCategory.Create(performanceCategory, string.Empty, PerformanceCounterCategoryType.SingleInstance, collection);
            }

            perfTotalAsyncCalls = new PerformanceCounter(performanceCategory, "Total Async Calls", false);
            perfTotalAsyncCalls.RawValue = 0;
            timeoutCounts = new PerformanceCounter(performanceCategory, "Timeouts", false);
            timeoutCounts.RawValue = 0;
            riskyTimeoutCounts = new PerformanceCounter(performanceCategory, "Risky Timeouts", false);
            riskyTimeoutCounts.RawValue = 0;
            perfPendingAsyncCallsCount = new PerformanceCounter(performanceCategory, "Pending Async Calls", false);
            perfPendingAsyncCallsCount.RawValue = 0;
        }

        private static AsyncLookupItem<T0, T1>[] GetAsyncLookupItems<T0, T1>(ICollection<T0> lookupKeys, DoLookup<T0, T1> asyncLookup)
        {
            int index = 0;
            var asyncLookupItems = new AsyncLookupItem<T0, T1>[lookupKeys.Count];
            foreach (var lookupKey in lookupKeys)
            {
                var asyncLookupItem = new AsyncLookupItem<T0, T1>(
                    index,
                    lookupKey,
                    new PortSet<T1, Exception>()
                );
                asyncLookup(asyncLookupItem.Key, asyncLookupItem.Result);
                asyncLookupItems[index] = asyncLookupItem;
                index++;
            }
            return asyncLookupItems;
        }
        private static IEnumerator<ITask> GetCollectionIterator<T0, T1>(ICollection<T0> keys, DoLookup<T0, T1> itemGetter, PortSet<ICollection<T1>, Exception> result)
        {
            var lookupItems = GetAsyncLookupItems<T0, T1>(keys, itemGetter);
            using (IEnumerator<ITask> enumerarator = HandleAsyncLookupItems<T0, T1>(lookupItems, result))
            {
                while (enumerarator.MoveNext())
                    yield return enumerarator.Current;
            }
        }
        private static IEnumerator<ITask> HandleAsyncLookupItems<T0, T1>(AsyncLookupItem<T0, T1>[] asyncLookupItems, PortSet<ICollection<T1>, Exception> result)
        {
            int countDown = asyncLookupItems.Length;
            if (countDown == 0)
            {
                result.Post(new List<T1>());
                yield break;
            }

            var items = new T1[asyncLookupItems.Length];
            foreach (var asyncLookupItem in asyncLookupItems)
            {
                yield return (Choice)asyncLookupItem.Result;
                Exception ex = asyncLookupItem.Result.Test<Exception>();
                if (ex != null)
                {
                    result.Post(ex);
                    yield break;
                }
                items[asyncLookupItem.Index] = asyncLookupItem.Result;
                if (Interlocked.Decrement(ref countDown) == 0)
                {
                    result.Post(items);
                    yield break;
                }
            }
        }

        /// <summary>
        /// Calls an async method that uses the IAsyncResult pattern
        /// Posts the result of the method call into a PortSet
        /// Includes a Timeout!
        /// </summary>
        /// <typeparam name="TResult">The result of the async method</typeparam>
        /// <param name="begin">The BeginXXX function</param>
        /// <param name="end">The EndXXX function</param>
        /// <param name="result"></param>
        /// <param name="timeout"></param>
        public static Choice Call<TResult>(Func<AsyncCallback, object, IAsyncResult> begin, Func<IAsyncResult, TResult> end, PortSet<TResult, Exception> result, TimeSpan timeout, Action finalizer)
        {
            // Convert to Choice object here, before "result" is nulled
            Choice choice = (Choice)result;

            try
            {
                // Start the async request
                IAsyncResult asyncResult = begin(
                    (ar) =>
                    {
                        perfPendingAsyncCallsCount.Decrement();

                        // Take ownership of the result port (ensuring only 1 value is posted)
                        // Moreover, by clearing "result" we remove references in the timeout
                        // task below, which lets memory get collected sooner.
                        var port = Interlocked.Exchange(ref result, null);

                        if (port != null)
                            asyncResult = null; // Encourage GC to collect asynResult

                        try
                        {
                            var r = end(ar);
                            if (port != null)
                                port.Post(r);
                        }
                        catch (Exception ex)
                        {
                            if (port != null)
                                port.Post(ex);
                        }
                        finally
                        {
                            FinalizeOnce(ref finalizer);
                        }
                    },
                    null
                );

                perfPendingAsyncCallsCount.Increment();
                perfTotalAsyncCalls.Increment();

                if (timeout < TimeSpan.MaxValue)
                    CcrService.Singleton.Activate(
                        Arbiter.Receive(
                            false,
                            CcrService.Singleton.TimeoutPort(timeout),
                            (time) =>
                            {
                                // Take ownership of the result port (ensuring only 1 value is posted)
                                var port = Interlocked.Exchange(ref result, null);

                                // If "port" is null, then that means we got a result before the timeout
                                if (port != null)
                                {
                                    port.Post(new TimeoutException(String.Format("AsyncHelper: timeout of {1} before {0}", end, time)));

                                    timeoutCounts.Increment();

                                    // See documentation for WebClientProtocol.Abort()
                                    var webAsyncResult = asyncResult as WebClientAsyncResult;
                                    if (webAsyncResult == null)
                                        // TODO: Are there other "abort" styles out there?
                                        riskyTimeoutCounts.Increment();
                                    else
                                        webAsyncResult.Abort();
                                }

                                FinalizeOnce(ref finalizer);
                            }
                        )
                    );
            }
            catch (Exception ex)
            {
                FinalizeOnce(ref finalizer);

                var port = Interlocked.Exchange(ref result, null);
                if (port != null)
                    port.Post(ex);
            }

            return choice;
        }

        private static void FinalizeOnce(ref Action finalizer)
        {
            var f = Interlocked.Exchange(ref finalizer, null);
            if (f != null)
                f();
        }

        public static TResult BlockingCall<TResult>(Func<AsyncCallback, object, IAsyncResult> begin, Func<IAsyncResult, TResult> end, TimeSpan timeout, Action finalizer)
        {
            // TODO: Pool these handles for better performance
            using (var wait = new EventWaitHandle(false, EventResetMode.ManualReset))
            {
                var result = new Ccr.ExceptionPort<TResult>();
                Call(begin, end, result, timeout, finalizer);

                // When a result comes in, repost the result and set the waiting handle.
                CcrService.Singleton.Activate(Arbiter.Choice(
                    result,
                    (t) => { result.Post(t); wait.Set(); },
                    (e) => { result.Post(e); wait.Set(); }
                    ));
                wait.WaitOne();

                return (TResult)result;
            }
        }

        public static void Call<TResult, Arg0>(Func<Arg0, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Func<IAsyncResult, TResult> end, PortSet<TResult, Exception> result, TimeSpan timeout, Action finalizer)
        {
            Call(
                (a, o) => begin(arg0, a, o),
                end,
                result, timeout, finalizer);
        }
        public static Choice Call<TResult, Arg0, Arg1>(Func<Arg0, Arg1, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Func<IAsyncResult, TResult> end, PortSet<TResult, Exception> result, TimeSpan timeout, Action finalizer)
        {
            return Call(
                (a, o) => begin(arg0, arg1, a, o),
                end,
                result, timeout, finalizer);
        }
        public static void Call<TResult, Arg0, Arg1, Arg2>(Func<Arg0, Arg1, Arg2, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Arg2 arg2, Func<IAsyncResult, TResult> end, PortSet<TResult, Exception> result, TimeSpan timeout, Action finalizer)
        {
            Call(
                (a, o) => begin(arg0, arg1, arg2, a, o),
                end,
                result, timeout, finalizer);
        }
        public static void Call<TResult, Arg0, Arg1, Arg2, Arg3>(Func<Arg0, Arg1, Arg2, Arg3, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Arg2 arg2, Arg3 arg3, Func<IAsyncResult, TResult> end, PortSet<TResult, Exception> result, TimeSpan timeout, Action finalizer)
        {
            Call(
                (a, o) => begin(arg0, arg1, arg2, arg3, a, o),
                end,
                result, timeout, finalizer);
        }
        public static void Call<TResult, Arg0, Arg1, Arg2, Arg3, Arg4>(Func<Arg0, Arg1, Arg2, Arg3, Arg4, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Arg2 arg2, Arg3 arg3, Arg4 arg4, Func<IAsyncResult, TResult> end, PortSet<TResult, Exception> result, TimeSpan timeout, Action finalizer)
        {
            Call(
                (a, o) => begin(arg0, arg1, arg2, arg3, arg4, a, o),
                end,
                result, timeout, finalizer);
        }
        public static void Call(Func<AsyncCallback, object, IAsyncResult> begin, Action<IAsyncResult> end, SuccessFailurePort result, TimeSpan timeout, Action finalizer)
        {
            Call<SuccessResult>(
                (a, o) => begin(a, o),
                (a) => { end(a); return SuccessResult.Instance; },
                result, timeout, finalizer);
        }
        public static void Call<Arg0>(Func<Arg0, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Action<IAsyncResult> end, SuccessFailurePort result, TimeSpan timeout, Action finalizer)
        {
            Call<SuccessResult>(
                (a, o) => begin(arg0, a, o),
                (a) => { end(a); return SuccessResult.Instance; },
                result, timeout, finalizer);
        }
        public static void Call<Arg0, Arg1>(Func<Arg0, Arg1, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Action<IAsyncResult> end, SuccessFailurePort result, TimeSpan timeout, Action finalizer)
        {
            Call<SuccessResult>(
                (a, o) => begin(arg0, arg1, a, o),
                (a) => { end(a); return SuccessResult.Instance; },
                result, timeout, finalizer);
        }
        public static void Call<Arg0, Arg1, Arg2>(Func<Arg0, Arg1, Arg2, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Arg2 arg2, Action<IAsyncResult> end, SuccessFailurePort result, TimeSpan timeout, Action finalizer)
        {
            Call<SuccessResult>(
                (a, o) => begin(arg0, arg1, arg2, a, o),
                (a) => { end(a); return SuccessResult.Instance; },
                result, timeout, finalizer);
        }
        public static void Call<Arg0, Arg1, Arg2, Arg3>(Func<Arg0, Arg1, Arg2, Arg3, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Arg2 arg2, Arg3 arg3, Action<IAsyncResult> end, SuccessFailurePort result, TimeSpan timeout, Action finalizer)
        {
            Call<SuccessResult>(
                (a, o) => begin(arg0, arg1, arg2, arg3, a, o),
                (a) => { end(a); return SuccessResult.Instance; },
                result, timeout, finalizer);
        }
        public static void Call<Arg0, Arg1, Arg2, Arg3, Arg4>(Func<Arg0, Arg1, Arg2, Arg3, Arg4, AsyncCallback, object, IAsyncResult> begin, Arg0 arg0, Arg1 arg1, Arg2 arg2, Arg3 arg3, Arg4 arg4, Action<IAsyncResult> end, SuccessFailurePort result, TimeSpan timeout, Action finalizer)
        {
            Call<SuccessResult>(
                (a, o) => begin(arg0, arg1, arg2, arg3, arg4, a, o),
                (a) => { end(a); return SuccessResult.Instance; },
                result, timeout, finalizer);
        }
        public static void GetCollection<T0, T1>(ICollection<T0> keys, DoLookup<T0, T1> itemGetter, PortSet<ICollection<T1>, Exception> result)
        {
            CcrService.Singleton.SpawnIterator(keys, itemGetter, result, GetCollectionIterator<T0, T1>);
        }

        public delegate void DoLookup<T0, T1>(T0 key, PortSet<T1, Exception> result);
    }
}
 