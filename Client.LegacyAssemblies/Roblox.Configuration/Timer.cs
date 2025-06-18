using System;
using System.Threading;

namespace Roblox
{
    public class SelfDisposingTimer
    {
        public SelfDisposingTimer(Action action, TimeSpan startTime, TimeSpan period)
        {
            this.action = action;
            this.period = period;
            timer = new Timer((weakThis) => OnTimer((WeakReference)weakThis), new WeakReference(this), startTime, period);
        }

        private static void OnTimer(WeakReference self)
        {
            if (self.Target is SelfDisposingTimer currentTimer)
                currentTimer.action();
        }
        public bool Change(TimeSpan dueTime, TimeSpan period)
        {
            this.period = period;
            return timer.Change(dueTime, period);
        }
        public void Stop()
        {
            timer.Dispose();
            timer = null;
        }

        ~SelfDisposingTimer()
        {
            timer?.Dispose();
        }

        internal void Pause() => timer.Change(-1, -1);
        internal void Unpause() => timer.Change(period, period);

        private readonly Action action;
        private Timer timer;
        private TimeSpan period;
    }
}
