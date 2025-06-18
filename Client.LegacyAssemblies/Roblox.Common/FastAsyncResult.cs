using System;
using System.Threading;

namespace Roblox.Common
{
    public class FastAsyncResult : IAsyncResult, IDisposable
    {
        // |------------------------| Fields |------------------------| \\

        private Exception _Error;
        private readonly AsyncCallback _Callback;
        private bool _IsCompleted = true;
        private readonly object _State;
        private ManualResetEvent _WaitHandle;

        // |------------------------| Fields |------------------------| \\

        // |------------------------| Constructors |------------------------| \\

        public FastAsyncResult(AsyncCallback callback, object state)
        {
            _Callback = callback;
            _State = state;
        }

        // |------------------------| Constructors |------------------------| \\

        // |------------------------| Properties |------------------------| \\

        public WaitHandle AsyncWaitHandle { get { return CreateWaitHandle(); } }
        public object AsyncState { get { return _State; } }
        public bool CompletedSynchronously { get { return false; } }
        public bool IsCompleted { get { return _IsCompleted; } }
        public Exception Error { get { return _Error; } }

        // |------------------------| Properties |------------------------| \\

        // |------------------------| Methods |------------------------| \\

        private WaitHandle CreateWaitHandle()
        {
            if (_WaitHandle != null) return _WaitHandle;

            var resetEvt = new ManualResetEvent(false);
            if (Interlocked.CompareExchange(ref _WaitHandle, resetEvt, null) != null) resetEvt.Close();
            if (_IsCompleted) _WaitHandle.Set();
            return _WaitHandle;
        }
        public void Dispose() { _WaitHandle?.Close(); }
        public void SetCompleted()
        {
            _IsCompleted = true;
            Thread.MemoryBarrier();
            _WaitHandle?.Set();
            _Callback?.Invoke(this);
        }
        public void SetCompleted(Exception error)
        {
            _Error = error;
            SetCompleted();
        }
        public void SetFailed(Exception error) { _Error = error; }

        // |------------------------| Methods |------------------------| \\
    }

    public class FastAsyncResult<T> : FastAsyncResult, IResult<T>
    {
        // |------------------------| Fields |------------------------| \\

        private T result;

        // |------------------------| Fields |------------------------| \\

        // |------------------------| Constructors |------------------------| \\

        public FastAsyncResult(AsyncCallback callback, object state)
            : base(callback, state)
        {
        }

        // |------------------------| Constructors |------------------------| \\

        // |------------------------| Properties |------------------------| \\

        [Obsolete("This property can throw, which is bad design. Use GetResult() and SetCompleted() instead")]
        public T Token { get { return GetResult(); } set { result = value; } }

        // |------------------------| Properties |------------------------| \\

        // |------------------------| Methods |------------------------| \\

        public T GetResult()
        {
            if (Error != null) throw Error;
            return result;
        }
        public void SetCompleted(T result)
        {
            this.result = result;
            SetCompleted();
        }

        // |------------------------| Methods |------------------------| \\
    }
}
