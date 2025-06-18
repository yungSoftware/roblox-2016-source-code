using System.Net.Sockets;
using System;

namespace Emcaster.Sockets
{
    public delegate void OnSocketException(Socket socket, SocketException socketExc);
    public delegate void OnException(Socket socket, Exception socketFailed);

    public interface ISourceReader: IPacketEvent
    {
   
        event OnSocketException SocketExceptionEvent;

        event OnException ExceptionEvent;

        void AcceptSocket(Socket socket, IAcceptor acceptor);
    }
}