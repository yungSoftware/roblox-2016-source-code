using System;
using System.Threading;

namespace Roblox.Common
{
    public class Result<T>
    {
        // |------------------------| Fields |------------------------| \\

        private Exception _Exception;
        private T _Value;

        // |------------------------| Fields |------------------------| \\

        // |------------------------| Constructors |------------------------| \\

        public Result(T value) { _Value = value; }
        public Result(Exception exception) { _Exception = exception; }

        // |------------------------| Constructors |------------------------| \\

        // |------------------------| Properties |------------------------| \\

        public Exception Exception { get { return _Exception; } }
        public T Value
        {
            get
            {
                if (_Exception != null) throw _Exception;
                return _Value;
            }
        }

        // |------------------------| Properties |------------------------| \\

        // |------------------------| Methods |------------------------| \\

        public void Test(Action<T> successHandler, Action<Exception> failureHandler)
        {
            try
            {
                if (_Exception != null) throw _Exception;
                successHandler?.Invoke(_Value);
            }
            catch (Exception ex)
            {
                failureHandler?.Invoke(ex);
            }
        }

        public void Test(Action<T> successHandler, Action<Exception> failureHandler, Action cleanupHandler)
        {
            try
            {
                if (_Exception != null) throw _Exception;
                successHandler?.Invoke(_Value);
            }
            catch (Exception ex)
            {
                failureHandler?.Invoke(ex);
            }
            finally
            {
                cleanupHandler?.Invoke();
            }
        }

        // |------------------------| Methods |------------------------| \\
    }

    public interface IResult<T>
    {
        // |------------------------| Methods |------------------------| \\

        T GetResult();

        // |------------------------| Methods |------------------------| \\
    }

    public class SynchronousCompletionAsyncResult : IAsyncResult
    {
        // |------------------------| Fields |------------------------| \\

        private Exception _Error;
        private readonly AsyncCallback _Callback;
        private bool _IsCompleted = true;
        private readonly object _State;

        // |------------------------| Fields |------------------------| \\

        // |------------------------| Constructors |------------------------| \\

        public SynchronousCompletionAsyncResult(AsyncCallback callback, object state)
        {
            _Callback = callback;
            _State = state;
        }
        public SynchronousCompletionAsyncResult(AsyncCallback callback, object state, bool setComplete)
        {
            _Callback = callback;
            _State = state;
            if (setComplete) SetCompleted();
        }
        public SynchronousCompletionAsyncResult(AsyncCallback callback, object state, Exception error)
        {
            _Callback = callback;
            _State = state;
            SetCompleted(error);
        }

        // |------------------------| Constructors |------------------------| \\

        // |------------------------| Properties |------------------------| \\

        public WaitHandle AsyncWaitHandle { get { throw new NotImplementedException(); } }
        public object AsyncState { get { return _State; } }
        public bool CompletedSynchronously { get { return true; } }
        public bool IsCompleted { get { return _IsCompleted; } }
        public Exception Error { get { return _Error; } }

        // |------------------------| Properties |------------------------| \\

        // |------------------------| Methods |------------------------| \\

        public void CheckResult()
        {
            if (_Error != null)
                throw _Error;
        }
        public void SetCompleted()
        {
            _IsCompleted = true;
            _Callback?.Invoke(this);
        }
        public void SetCompleted(Exception error)
        {
            _Error = error;
            SetCompleted();
        }

        // |------------------------| Methods |------------------------| \\
    }

    public class SynchronousCompletionAsyncResult<T> : SynchronousCompletionAsyncResult, IResult<T>
    {
        // |------------------------| Fields |------------------------| \\

        private T result;

        // |------------------------| Fields |------------------------| \\

        // |------------------------| Constructors |------------------------| \\

        public SynchronousCompletionAsyncResult(T token, AsyncCallback callback, object state)
            : base(callback, state)
        {
            result = token;
            SetCompleted();
        }

        // |------------------------| Constructors |------------------------| \\

        // |------------------------| Properties |------------------------| \\

        [Obsolete("This property can throw, which is bad design. Use GetResult() and SetCompleted() instead")]
        public T Token { get { return GetResult(); } }

        // |------------------------| Properties |------------------------| \\

        // |------------------------| Methods |------------------------| \\

        public T GetResult()
        {
            if (Error != null) throw Error;
            return result;
        }

        // |------------------------| Methods |------------------------| \\
    }
}
