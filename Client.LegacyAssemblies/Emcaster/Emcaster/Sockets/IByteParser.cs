using System.Net;

namespace Emcaster.Sockets
{
    public interface IByteParser
    {
        void OnBytes(EndPoint endpoint, byte[] data, int offset, int length);
    }
}