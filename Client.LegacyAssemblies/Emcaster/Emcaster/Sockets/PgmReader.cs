using System;
using System.Net;
using System.Net.Sockets;
using Common.Logging;

namespace Emcaster.Sockets
{

    public interface IAcceptor
    {
        bool IsRunning { get; }
    }

    public interface ISocketErrorHandler
    {
        void OnSocketException(Socket endpoint, SocketException failed);
        void OnException(Socket endpoint, Exception failed);
    }

    public class PgmReader : ISourceReader, IPacketEvent, ISocketErrorHandler
    {
        private static readonly ILog log = LogManager.GetLogger(typeof (PgmReader));

        public event OnReceive ReceiveEvent;

        private readonly IByteParserFactory _parserFactory;

        private int _receiveBufferSize = 1024*1024;
        private int _readBuffer = 1024*130;
        private bool _forceBlockingOnEveryReceive = false;

        public event OnSocketException SocketExceptionEvent = delegate {};
        public event OnException ExceptionEvent = delegate {};

        public PgmReader(IByteParserFactory factory)
        {
            _parserFactory = factory;
        }

        public int ReceiveBufferInBytes
        {
            set { _receiveBufferSize = (value); }
            get { return _receiveBufferSize;  }
        }

        public int ReadBufferInBytes
        {
            set { _readBuffer = (value); }
            get { return _readBuffer;  }
        }

        /// <summary>
        /// Set to true to compensate for strange bug in socket protocol.
        /// Not always needed.
        /// </summary>
        public bool ForceBlockingOnEveryReceive
        {
            get { return _forceBlockingOnEveryReceive; }
            set { _forceBlockingOnEveryReceive = value; }
        }


        public void AcceptSocket(Socket receiveSocket, IAcceptor acceptor)
        {
            try
            {
                IByteParser parser = _parserFactory.Create(receiveSocket);
                PgmSocket.EnableGigabit(receiveSocket);
                if (_receiveBufferSize > 0)
                {
                    receiveSocket.ReceiveBufferSize = _receiveBufferSize;
                }
                byte[] buffer = new byte[_readBuffer];
                AsyncReader reader = new AsyncReader(parser, buffer, acceptor, this, receiveSocket);
                reader.BeginReceive();
            }catch(Exception failed)
            {
                receiveSocket.Close();
                log.Error("BeginReceive Failed", failed);
            }
        }

        public void OnSocketException(Socket endpoint, SocketException failed)
        {
            SocketExceptionEvent(endpoint, failed);
        }

        public void OnException(Socket socket, Exception error)
        {
            ExceptionEvent(socket, error);
        }
    }
}