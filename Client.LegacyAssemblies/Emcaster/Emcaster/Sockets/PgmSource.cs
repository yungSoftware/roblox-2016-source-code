using System;
using System.Net;
using System.Net.Sockets;
using Common.Logging;

namespace Emcaster.Sockets
{
    public class PgmSource : IDisposable, IByteWriter
    {
        private static ILog log = LogManager.GetLogger(typeof (PgmSource));

        private readonly string _ip;
        private readonly int _port;
        private readonly PgmSocket _socket;
        private int _sendSocketSize = 1024*1024;

        private uint _rateKbitsPerSec = 1024*10;
        private uint _windowSizeInMSecs;
        private uint _windowSizeInBytes = 1000*1000*10;

        private int _bindPort;
        private string _bindInterface;

        public PgmSource(string address, int port)
        {
            _socket = new PgmSocket();
            _ip = address;
            _port = port;
        }

        public uint RateKbitsPerSec
        {
            set { _rateKbitsPerSec = value; }
            get { return _rateKbitsPerSec; }
        }

        public uint WindowSizeInMSecs
        {
            set { _windowSizeInMSecs = value; }
            get { return _windowSizeInMSecs; }
        }

        public uint WindowSizeinBytes
        {
            set { _windowSizeInBytes = value; }
            get { return _windowSizeInBytes; }
        }

        public int SocketBufferSize
        {
            set { _sendSocketSize = value; }
            get { return _sendSocketSize; }
        }

        public string BindInterface
        {
            set { _bindInterface = value; }
            get { return _bindInterface; }
        }

        public int BindPort
        {
            set { _bindPort = value; }
            get { return _bindPort; }
        }

        public PgmSocket Socket
        {
            get { return _socket; }
        }


        public void Start()
        {
            IPAddress ipAddr = IPAddress.Parse(_ip);
            IPEndPoint end = new IPEndPoint(ipAddr, _port);
            _socket.SendBufferSize = _sendSocketSize;
            IPAddress local = IPAddress.Any;
            if (_bindInterface != null)
            {
                local = IPAddress.Parse(_bindInterface);
            }
            _socket.Bind(new IPEndPoint(local, _bindPort));
            SetSendWindow();
            PgmSocket.EnableGigabit(_socket);
            _socket.ApplySocketOptions();
            _socket.Connect(end);
        }

        public bool Write(byte[] data, int offset, int length, int msWaitIgnored)
        {
            _socket.Send(data, offset, length, SocketFlags.None);
            return true;
        }

        public int Publish(params byte[] dataToPublish)
        {
            return _socket.Send(dataToPublish);
        }


        public void Dispose()
        {
            try
            {
                _socket.Close();
            }
            catch (Exception failed)
            {
                log.Warn("close failed", failed);
            }
        }

        private unsafe void SetSendWindow()
        {
            _RM_SEND_WINDOW window = new _RM_SEND_WINDOW();
            window.RateKbitsPerSec = RateKbitsPerSec;
            window.WindowSizeInMSecs = WindowSizeInMSecs;
            window.WindowSizeInBytes = WindowSizeinBytes;
            byte[] allData = PgmSocket.ConvertStructToBytes(window);
            _socket.SetSocketOption(PgmSocket.PGM_LEVEL, (SocketOptionName) 1001, allData);
        }


        public unsafe _RM_SEND_WINDOW GetSendWindow()
        {
            int size = sizeof (_RM_SEND_WINDOW);
            byte[] data = _socket.GetSocketOption(PgmSocket.PGM_LEVEL, (SocketOptionName) 1001, size);
            fixed (byte* pBytes = &data[0])
            {
                return *((_RM_SEND_WINDOW*) pBytes);
            }
        }

        public unsafe _RM_SENDER_STATS GetSenderStats()
        {
            int size = sizeof (_RM_SENDER_STATS);
            byte[] data = _socket.GetSocketOption(PgmSocket.PGM_LEVEL, (SocketOptionName) 1005, size);
            fixed (byte* pBytes = &data[0])
            {
                return *((_RM_SENDER_STATS*) pBytes);
            }
        }
    }
}