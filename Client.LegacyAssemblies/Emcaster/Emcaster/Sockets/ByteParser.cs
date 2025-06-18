using System.Net.Sockets;
using System.Net;

namespace Emcaster.Sockets
{
    public class ByteParser : IByteParserFactory, IByteParser, IPacketEvent
    {
        public event OnReceive ReceiveEvent;

        public IByteParser Create(Socket socket)
        {
            return this;
        }

        public void OnBytes(EndPoint endpoint, byte[] data, int offset, int length)
        {
            OnReceive onMsg = ReceiveEvent;
            if (onMsg != null)
            {
                onMsg(endpoint, data, offset, length);
            }
        }
    }
}