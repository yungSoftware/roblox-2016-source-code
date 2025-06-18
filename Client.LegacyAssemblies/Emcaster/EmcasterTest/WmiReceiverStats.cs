using System.Diagnostics;
using System.Net;

namespace Emcaster.Sockets
{
    public class WmiReceiverStats: System.IDisposable
    {

        public static readonly string CAT = "Emcaster Receiver Socket";

        static WmiReceiverStats()
        {
            // Set up the performance counter(s) if they don't already exist
            if (PerformanceCounterCategory.Exists("Emcaster Receiver Socket"))
            {
                PerformanceCounterCategory.Delete("Emcaster Receiver Socket");
            }
            CounterCreationDataCollection counters = new CounterCreationDataCollection();

            CounterCreationData bytes = new CounterCreationData();
            bytes.CounterName = "Bytes/Sec";
            bytes.CounterHelp = "Bytes Received Per Second";
            bytes.CounterType = PerformanceCounterType.RateOfCountsPerSecond64;
            counters.Add(bytes);

            CounterCreationData packets = new CounterCreationData();
            packets.CounterName = "Packets/Sec";
            packets.CounterHelp = "Packets Received Per Second";
            packets.CounterType = PerformanceCounterType.RateOfCountsPerSecond32;
            counters.Add(packets);

            CounterCreationData socketExc = new CounterCreationData();
            socketExc.CounterName = "Socket Disconnects";
            socketExc.CounterHelp = "Total Socket Disconnects";
            socketExc.CounterType = PerformanceCounterType.NumberOfItems64;
            counters.Add(socketExc);

            CounterCreationData appExc = new CounterCreationData();
            appExc.CounterName = "Application Disconnects";
            appExc.CounterHelp = "Disconnects caused by application exceptions";
            appExc.CounterType = PerformanceCounterType.NumberOfItems64;
            counters.Add(appExc);

            // Create the category and all of the counters.
            PerformanceCounterCategory.Create(CAT,
               "Receiver Stats for an Emcaster Pgm Socket",
               PerformanceCounterCategoryType.MultiInstance,
               counters);
        }

        private readonly PerformanceCounter _byteCounter;
        private readonly PerformanceCounter _packetCounter;
        private readonly PerformanceCounter _socketExcCounter;
        private readonly PerformanceCounter _appExcCounter;

        private readonly ISourceReader _reader;
   
        public WmiReceiverStats(string instanceName, ISourceReader target)
        {
            _byteCounter = new PerformanceCounter(CAT, "Bytes/Sec", instanceName, false);
            _packetCounter = new PerformanceCounter(CAT, "Packets/Sec", instanceName, false);
            _socketExcCounter = new PerformanceCounter(CAT, "Socket Disconnects", instanceName, false);
            _appExcCounter = new PerformanceCounter(CAT, "Application Disconnects", instanceName, false);

            _reader = target;
        }

        public void Start()
        {
            _reader.ExceptionEvent += OnAppDisconnect;
            _reader.SocketExceptionEvent += OnDisconnect;
            _reader.ReceiveEvent += OnBytes;
        }

        void OnAppDisconnect(System.Net.Sockets.Socket socket, System.Exception socketFailed)
        {
            _appExcCounter.Increment();    
        }

        void OnDisconnect(System.Net.Sockets.Socket socket, System.Net.Sockets.SocketException socketExc)
        {
            _socketExcCounter.Increment();
        }

        private void OnBytes(EndPoint endpoint, byte[] data, int offset, int length)
        {
            _packetCounter.Increment();
            _byteCounter.IncrementBy(length);
        }

        public void Stop()
        {
            _reader.ExceptionEvent -= OnAppDisconnect;
            _reader.SocketExceptionEvent -= OnDisconnect;
            _reader.ReceiveEvent -= OnBytes;
        }

        public void Dispose()
        {
            Stop();
        }
    }
}
