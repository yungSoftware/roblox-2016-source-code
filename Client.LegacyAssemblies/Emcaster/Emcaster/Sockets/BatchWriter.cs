using System;
using System.Net.Sockets;
using System.Threading;
using Common.Logging;

namespace Emcaster.Sockets
{
    /// <summary>
    /// Writes bytes to a pending buffer. Thread safe for several writing threads.
    /// </summary>
    public class BatchWriter : IByteWriter
    {
        private static ILog log = LogManager.GetLogger(typeof (BatchWriter));

        private object _lock = new object();

        private ByteBuffer _pendingBuffer;
        private ByteBuffer _flushBuffer;
        private IByteWriter _target;
        private bool _running = true;
        private int _minFlushSize = 1024*10;
        private int _sleepOnMin = 10;

        private Timer _timer;
        private bool _printStats = false;
        private int _statsInterval = 10;
        private int _msgCount = 0;
        private long _flushedBytes = 0;
        private long _flushes = 0;
        private long _sleepTime = 0;
        private int _alwaysSleep = -1;

        public BatchWriter(IByteWriter target, int maxBufferSizeInBytes)
        {  
            _target = target;
            _pendingBuffer = new ByteBuffer(maxBufferSizeInBytes);
            _flushBuffer = new ByteBuffer(maxBufferSizeInBytes);
            _minFlushSize = maxBufferSizeInBytes/2;
        }

        public int SleepOnMin
        {
            set { _sleepOnMin = value; }
            get { return _sleepOnMin; }
        }

        public int MinFlushSizeInBytes
        {
            set { _minFlushSize = value; }
            get { return _minFlushSize; }
        }

        public int AlwaysSleep
        {
            set { _alwaysSleep = value; }
            get { return _alwaysSleep;  }
        }

        public bool PrintStats
        {
            get { return _printStats; }
            set { _printStats = value; }
        }

        public int StatsIntervalInSeconds
        {
            get { return _statsInterval; }
            set { _statsInterval = value; }
        }

        /// <summary>
        /// Add bytes to the buffer. If the buffer is full, then the thread waits for
        /// the buffer to be flushed by the flushing thread. Thread Safe.
        /// </summary>
        /// <param name="buffer"></param>
        /// <param name="offset"></param>
        /// <param name="size"></param>
        /// <returns>true if bytes are bufferred. false if the wait times out.</returns>
        public bool Write(byte[] buffer, int offset, int size, int waitMs)
        {
            lock (_lock)
            {
                while ((_pendingBuffer.Length + size) > _pendingBuffer.Capacity && _running)
                {
                    if (!Monitor.Wait(_lock, waitMs))
                    {
                        return false;
                    }
                }
                if (!_running)
                    return false;

                _pendingBuffer.Write(buffer, offset, size);
                if (_printStats)
                    _msgCount++;
                // other threads could be waiting to buffer Or the flush thread 
                // could be waiting to retry.
                Monitor.PulseAll(_lock);
                return true;
            }
        }

        internal void FlushBuffer()
        {
            lock (_lock)
            {
                while (_running && _pendingBuffer.Length == 0)
                {
                    Monitor.Wait(_lock);
                }
                if (!_running)
                {
                    return;
                }
                ByteBuffer swap = _flushBuffer;
                _flushBuffer = _pendingBuffer;
                _pendingBuffer = swap;
                // there may be many threads waiting to add to the buffer.
                Monitor.PulseAll(_lock);
            }
            long length = _flushBuffer.Length;
            if (length > 0)
            {
                try
                {
                    _flushBuffer.WriteTo(_target);
                }
                catch (Exception failed)
                {
                    log.Error("Async Flush Failed msg: " + failed.Message + " stack: " + failed.StackTrace);
                }
                _flushBuffer.Reset();
                if (_printStats)
                {
                    _flushes++;
                    _flushedBytes += length;
                }
                if (length < _minFlushSize)
                {
                    Sleep(_sleepOnMin);
                }else if(_alwaysSleep >=0)
                {
                    Sleep(_alwaysSleep);
                }
            }
        }

        private void Sleep(int sleep)
        {
            Thread.Sleep(sleep);
            if (_printStats)
            {
                _sleepTime += sleep;
            }
        }

        internal void FlushRunner()
        {
            log.Debug("Started Flush Thread for " + GetType().FullName);
            while (_running)
            {
                FlushBuffer();
            }
        }

        public void Start()
        {
            WaitCallback callback =
                delegate { FlushRunner(); };
            ThreadPool.QueueUserWorkItem(callback);
            StartStats();
        }

        public void StartStats()
        {
            if (_printStats)
            {
                TimerCallback timerCallBack = delegate { LogStats(); };
                _timer = new Timer(timerCallBack, null, _statsInterval * 1000, _statsInterval * 1000);
            }
        }

        private void LogStats()
        {
            double avgBytes = 0;
            if (_flushes > 0)
                avgBytes = (_flushedBytes/_flushes);

            int avgMessages = _msgCount / _statsInterval;
            log.Info("MsgAvg: " + avgMessages + " Flushes: " + _flushes + " Avg/Bytes: " + avgBytes + " Sleep(ms): " + _sleepTime);
            _msgCount = 0;
            _flushes = 0;
            _flushedBytes = 0;
            _sleepTime = 0;
        }

        public void StopStats()
        {
            if (_timer != null)
            {
                _timer.Dispose();
            }
        }

        public void Dispose()
        {
            log.Info(GetType().FullName + " Disposed");
            StopStats();
            lock (_lock)
            {
                _running = false;
                Monitor.PulseAll(_lock);
            }
        }
    }
}