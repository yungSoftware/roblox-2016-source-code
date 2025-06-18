using System.Net.Sockets;

namespace Emcaster.Sockets
{
    public interface IByteParserFactory
    {
        IByteParser Create(Socket socket);
    }
}