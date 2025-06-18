using System;

namespace Roblox.Common
{
    public class Request<T>
    {
        public static Result<CompletionSignal> GetResponse(Action<IAsyncResult> responseHandler, IAsyncResult asyncResult)
        {
            try
            {
                responseHandler(asyncResult);
                return new Result<CompletionSignal>(CompletionSignal.Instance);
            }
            catch (Exception ex) { return new Result<CompletionSignal>(ex); }
        }
        public static Result<T> GetResponse(Func<IAsyncResult, T> responseHandler, IAsyncResult asyncResult)
        {
            try { return new Result<T>(responseHandler(asyncResult)); }
            catch (Exception ex) { return new Result<T>(ex); }
        }
        public static void HandleResponse(Func<AsyncCallback, object, IAsyncResult> beginHandler, Action<IAsyncResult> endHandler, Action<Result<CompletionSignal>> resultHandler)
        {
            beginHandler(ar => resultHandler(GetResponse(endHandler, ar)), null);
        }
        public static void HandleResponse<Arg0>(Func<Arg0, AsyncCallback, object, IAsyncResult> beginHandler, Arg0 arg0, Action<IAsyncResult> endHandler, Action<Result<CompletionSignal>> resultHandler)
        {
            HandleResponse((c, s) => beginHandler(arg0, c, s), endHandler, resultHandler);
        }
        public static void HandleResponse<Arg0, Arg1>(Func<Arg0, Arg1, AsyncCallback, object, IAsyncResult> beginHandler, Arg0 arg0, Arg1 arg1, Action<IAsyncResult> endHandler, Action<Result<CompletionSignal>> resultHandler)
        {
            HandleResponse((c, s) => beginHandler(arg0, arg1, c, s), endHandler, resultHandler);
        }
        public static void HandleResponse<Arg0, Arg1, Arg2>(Func<Arg0, Arg1, Arg2, AsyncCallback, object, IAsyncResult> beginHandler, Arg0 arg0, Arg1 arg1, Arg2 arg2, Action<IAsyncResult> endHandler, Action<Result<CompletionSignal>> resultHandler)
        {
            HandleResponse((c, s) => beginHandler(arg0, arg1, arg2, c, s), endHandler, resultHandler);
        }
        public static void HandleResponse(Func<AsyncCallback, object, IAsyncResult> beginHandler, Func<IAsyncResult, T> endHandler, Action<Result<T>> resultHandler)
        {
            beginHandler(ar => resultHandler(GetResponse(endHandler, ar)), null);
        }
        public static void HandleResponse<Arg0>(Func<Arg0, AsyncCallback, object, IAsyncResult> beginHandler, Arg0 arg0, Func<IAsyncResult, T> endHandler, Action<Result<T>> resultHandler)
        {
            HandleResponse((c, s) => beginHandler(arg0, c, s), endHandler, resultHandler);
        }
        public static void HandleResponse<Arg0, Arg1>(Func<Arg0, Arg1, AsyncCallback, object, IAsyncResult> beginHandler, Arg0 arg0, Arg1 arg1, Func<IAsyncResult, T> endHandler, Action<Result<T>> resultHandler)
        {
            HandleResponse((c, s) => beginHandler(arg0, arg1, c, s), endHandler, resultHandler);
        }
        public static void HandleResponse<Arg0, Arg1, Arg2>(Func<Arg0, Arg1, Arg2, AsyncCallback, object, IAsyncResult> beginHandler, Arg0 arg0, Arg1 arg1, Arg2 arg2, Func<IAsyncResult, T> endHandler, Action<Result<T>> resultHandler)
        {
            HandleResponse((c, s) => beginHandler(arg0, arg1, arg2, c, s), endHandler, resultHandler);
        }
    }
}
