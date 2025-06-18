using System;
using Microsoft.Ccr.Core;

namespace Roblox.Common
{
    public class AsyncWorkQueue<T>
    {
        internal class WorkItem
        {
            private Action _CompletionTask;
            private T _Item;
            private SuccessFailurePort _Result;

            internal Action CompletionTask
            {
                get { return _CompletionTask; }
            }
            internal T Item
            {
                get { return _Item; }
            }
            internal SuccessFailurePort Result
            {
                get { return _Result; }
            }

            internal WorkItem(T item)
            {
                _Item = item;
            }
            internal WorkItem(T item, Action completionTask)
            {
                _CompletionTask = completionTask;
                _Item = item;
            }
            internal WorkItem(T item, SuccessFailurePort result)
            {
                _Item = item;
                _Result = result;
            }
        }

        private DispatcherQueue _DispatcherQueue;
        private AsyncItemHandler _ItemHandler;
        private Port<WorkItem> _QueuedItems = new Port<WorkItem>();

        public AsyncWorkQueue(DispatcherQueue dispatcherQueue, AsyncItemHandler itemHandler)
        {
            if (itemHandler == null)
                throw new ApplicationException("AsyncWorkQueue initialization failed.  Valid AsyncItemHandler required.");

            _DispatcherQueue = dispatcherQueue;
            _ItemHandler = itemHandler;

            var receiver = Arbiter.Receive<WorkItem>(
                true,
                _QueuedItems,
                (workItem) => DoWork(workItem)
            );
            Arbiter.Activate(_DispatcherQueue, receiver);
        }

        private void DoCompletionTask(SuccessFailurePort itemHandlerResult, Action completionTask)
        {
            var choice = Arbiter.Choice(
                itemHandlerResult,
                (success) => completionTask(),
                (failure) => ExceptionHandler.LogException(failure)
            );
            Arbiter.Activate(_DispatcherQueue, choice);
        }
        private void DoWork(WorkItem workItem)
        {
            SuccessFailurePort result;

            if (workItem.Result != null)
                result = workItem.Result;
            else
                result = new SuccessFailurePort();

            _ItemHandler(workItem.Item, result);

            if (workItem.CompletionTask != null)
                DoCompletionTask(result, workItem.CompletionTask);
        }

        public void EnqueueWorkItem(T item)
        {
            _QueuedItems.Post(new WorkItem(item));
        }
        public void EnqueueWorkItem(T item, Action completionTask)
        {
            _QueuedItems.Post(new WorkItem(item, completionTask));
        }
        public void EnqueueWorkItem(T item, SuccessFailurePort result)
        {
            _QueuedItems.Post(new WorkItem(item, result));
        }

        public delegate void AsyncItemHandler(T item, SuccessFailurePort result);
    }
}
