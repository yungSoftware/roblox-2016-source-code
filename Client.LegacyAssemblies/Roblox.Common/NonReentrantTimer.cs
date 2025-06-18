using System;
using System.Threading;

namespace Roblox.Common
{
    public class NonReentrantTimer : MarshalByRefObject, IDisposable
    {
        private Timer _timer;
        private TimerCallback _callback;
        private TimerCallback _skipExecutionCallback;
        private int _count;

        private NonReentrantTimer(TimerCallback callback)
        {
            _callback = callback;
            _count = 0;
            _skipExecutionCallback = null;
        }
        public NonReentrantTimer(TimerCallback callback, object state, int dueTime, int period) : this(callback)
        {
            _timer = new Timer(InternalCallback, state, dueTime, period);
        }
        public NonReentrantTimer(TimerCallback callback, object state, long dueTime, long period) 
            : this(callback)
        {
            _timer = new Timer(InternalCallback, state, dueTime, period);
        }
        public NonReentrantTimer(TimerCallback callback, object state, TimeSpan dueTime, TimeSpan period) 
            : this(callback)
        {
            _timer = new Timer(InternalCallback, state, dueTime, period);
        }
        public NonReentrantTimer(TimerCallback callback, object state, uint dueTime, uint period) 
            : this(callback)
        {
            _timer = new Timer(InternalCallback, state, dueTime, period);
        }

        public TimerCallback SkipExecutionCallback { get { return _skipExecutionCallback; } set { _skipExecutionCallback = value; } }

        public bool Change(int dueTime, int period)
        {
            return _timer.Change(dueTime, period);
        }
        public bool Change(long dueTime, long period)
        {
            return _timer.Change(dueTime, period);
        }
        public bool Change(TimeSpan dueTime, TimeSpan period)
        {
            return _timer.Change(dueTime, period);
        }
        public bool Change(uint dueTime, uint period)
        {
            return _timer.Change(dueTime, period);
        }
        private void InternalCallback(object state)
        {
            try
            {
                if (Interlocked.Increment(ref _count) == 1) _callback(state);
                else _skipExecutionCallback?.Invoke(state);
            }
            finally
            {
                Interlocked.Decrement(ref _count);
            }
        }
        public bool Dispose(WaitHandle notifyObject)
        {
            return _timer != null && _timer.Dispose(notifyObject);
        }
        public void Dispose()
        {
            _timer?.Dispose();
        }
    }
}
