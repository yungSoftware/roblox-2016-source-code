using System.Net.Sockets;
using System;

namespace Emcaster.Sockets
{
    public class UdpSource:IByteWriter, IDisposable
    {
        private readonly UdpClient _client;

        public UdpSource(string address, int port)
        {
            _client = new UdpClient(address, port); 
        }

        public UdpClient Client
        {
            get { return _client; }
        }

        public void Start()
        {
            // nothing to do
        }

        public void Dispose()
        {
            _client.Close();
        }

        public bool Write(byte[] data, int offset, int length, int msWaitIgnored)
        {
            if (offset == 0)
            {
                _client.Send(data, length);
            }
            else
            {
                byte[] bytes = new byte[length];
                System.Array.Copy(data, offset, bytes, 0, length);
                _client.Send(bytes, length);
            }
            return true;
        }

    }
}
