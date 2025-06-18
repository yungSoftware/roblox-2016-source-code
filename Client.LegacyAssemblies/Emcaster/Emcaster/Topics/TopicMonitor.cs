using System;
using System.Threading;
using Common.Logging;

namespace Emcaster.Topics
{
    public class TopicMonitor : IDisposable
    {
        private readonly ILog log;
        private readonly int _interval;
        private Timer _timer;

        private long _msgCount;

        public TopicMonitor(string logName, int intervalSeconds)
        {
            log = LogManager.GetLogger(logName);
            _interval = intervalSeconds;
        }

        private void OnTimer()
        {
            double avg = (_msgCount/_interval);
            log.Info("msg count: " + _msgCount + " avg/sec: " + avg);
            _msgCount = 0;
        }


        public void Start()
        {
            TimerCallback callback = delegate { OnTimer(); };
            _timer = new Timer(callback, null, 1000*_interval, 1000*_interval);
        }

        public void Dispose()
        {
            if (_timer != null)
            {
                _timer.Dispose();
            }
        }

        public void OnMessage(IMessageParser parser)
        {
            _msgCount++;
        }
    }
}