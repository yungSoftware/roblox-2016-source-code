using System;
using System.Threading;

namespace Roblox
{
    public static class RobloxThreadPool
    {
        private static int _QueueLength;

        public static int QueueLength { get { return _QueueLength; } }

        public static void GetAvailableThreads(out int workerThreads, out int completionPortThreads)
            => ThreadPool.GetAvailableThreads(out workerThreads, out completionPortThreads);
        
        public static bool QueueUserWorkItem(Action callback)
        {
            Interlocked.Increment(ref _QueueLength);
            return ThreadPool.QueueUserWorkItem((s) =>
            {
                try
                {
                    callback();
                }
                catch (ThreadAbortException)
                {
                    throw;
                }
                catch (Exception ex)
                {
                    ExceptionHandler.LogException(ex);
                }
                finally
                {
                    Interlocked.Decrement(ref _QueueLength);
                }
            });
        }
    }
}
