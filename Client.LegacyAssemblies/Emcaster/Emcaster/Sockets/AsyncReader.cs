using System;
using System.Net;
using System.Net.Sockets;
using Common.Logging;

namespace Emcaster.Sockets
{
    public class AsyncReader
    {
        private readonly IByteParser _parser;
        private readonly byte[] _buffer;
        private readonly IAcceptor _acceptor;
        private readonly ISocketErrorHandler _errorHandler;
        private readonly Socket _socket;
        private readonly EndPoint _endpoint;
        private readonly ILog _log;
        private bool _running = true;

        public AsyncReader(IByteParser parser, byte[] buffer, IAcceptor acceptor, ISocketErrorHandler errorHandler, Socket socket)
        {
            _parser = parser;
            _buffer = buffer;
            _acceptor = acceptor;
            _errorHandler = errorHandler;
            _socket = socket;
            _endpoint = socket.RemoteEndPoint;
            _log = LogManager.GetLogger(_endpoint.ToString());
        }

        public void BeginReceive()
        {
            _socket.BeginReceive(_buffer, 0, _buffer.Length, SocketFlags.None, OnReadBytes, null);
        }

        private void OnReadBytes(IAsyncResult ar)
        {
            if(!_acceptor.IsRunning || !_running)
            {
                AttemptClose();
                return;
            }
            try
            {
                int read = _socket.EndReceive(ar);
                if (read > 0)
                {
                    _parser.OnBytes(_endpoint, _buffer, 0, read);
                    BeginReceive();
                }
                else
                {
                    _log.Info("End Read");
                }
            }catch(SocketException socketExc)
            {
                _errorHandler.OnSocketException(_socket, socketExc);
                AttemptClose();
            }
            catch(Exception failed)
            {
                _errorHandler.OnException(_socket, failed);
                AttemptClose();
            }
        }

        public void Close()
        {
            AttemptClose();
        }

        private readonly object _diposeLock = new object();
        private void AttemptClose()
        {
            lock (_diposeLock)
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
                        _log.Error("Close Failed", failed);
                    }
                }
            }
        }
    }
}
