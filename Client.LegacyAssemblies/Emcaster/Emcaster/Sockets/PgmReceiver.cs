using System;
using System.Net;
using System.Net.Sockets;
using System.Collections.Generic;
using Common.Logging;

namespace Emcaster.Sockets
{
    public delegate void OnReceive(EndPoint endPoint, byte[] data, int offset, int length);

    public class PgmReceiver : IDisposable, IAcceptor
    {
        private static ILog log = LogManager.GetLogger(typeof (PgmReceiver));

        private bool _running = true;
        private string _ip;
        private int _port;
        private readonly PgmSocket _socket;
        private readonly ISourceReader _reader;
        private int _receiveBufferInBytes = 1024*128;
        private readonly IList<uint> _interfaceAddresses = new List<uint>();

        public PgmReceiver(string address, int port, ISourceReader reader)
        {
            _socket = new PgmSocket();
            _ip = address;
            _port = port;
            _reader = reader;
        }

        /// <summary>
        /// Set the address for binding the socket
        /// </summary>
        public void AddInterfaceAddress(string address)
        {
            IPAddress ip = IPAddress.Parse(address);
            _interfaceAddresses.Add((uint)ip.Address);
        }

        public string Address
        {
            set { _ip = value; }
        }

        public int Port
        {
            set { _port = value; }
        }

        public int ReceiveBufferInBytes
        {
            get { return _receiveBufferInBytes;  }
            set { _receiveBufferInBytes = value; }
        }

        public void Start()
        {
            _socket.ReceiveBufferSize = _receiveBufferInBytes;
            IPAddress ipAddr = IPAddress.Parse(_ip);
            IPEndPoint end = new IPEndPoint(ipAddr, _port);
            _socket.Bind(end);
            foreach(uint address in _interfaceAddresses)
            {
                byte[] bits = BitConverter.GetBytes(address);
                _socket.SetPgmOption(PgmConstants.RM_ADD_RECEIVE_IF, bits); 
 
            }
            _socket.ApplySocketOptions();
            PgmSocket.EnableGigabit(_socket);
            _socket.Listen(5);
            log.Info("Listening: " + end);
            _socket.BeginAccept(OnAccept, null);
        }

        private void OnAccept(IAsyncResult ar)
        {
            try
            {
                Socket conn = _socket.EndAccept(ar);
                log.Info("Connection from: " + conn.RemoteEndPoint);
                _reader.AcceptSocket(conn, this);
                _socket.BeginAccept(OnAccept, null);
            }catch(Exception failed)
            {
                if (_running)
                    log.Warn("Accept Failed", failed);
            }
        }

        private readonly object _disposeLock = new object();
        public void Dispose()
        {
            lock (_disposeLock)
            {
                if (_running)
                {
                    _running = false;
                    try
                    {
                        _socket.Close();
                    }
                    catch (Exception failed)
                    {
                        log.Warn("close failed", failed);
                    }
                }
            }
        }

        public bool IsRunning
        {
            get { return _running; }
        }     
    }
}