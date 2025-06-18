using System.Net.Sockets;
using System.Net;
using System;
using System.Threading;
using Common.Logging;

namespace Emcaster.Sockets
{
    public class UdpReceiver : IPacketEvent, IDisposable
    {
        public static readonly ILog log = LogManager.GetLogger(typeof(UdpReceiver));

        public event OnReceive ReceiveEvent;

        private readonly UdpClient _client;
        private readonly IPAddress _address;
        private bool _running = true;
        private readonly AsyncCallback _runner;

        public UdpReceiver(string address, int port)
        {
            _client = new UdpClient(port);
            _address = IPAddress.Parse(address);
            _runner = delegate(IAsyncResult ar)
            {
                try
                {
                    Receive(ar);
                }
                catch (Exception failed)
                {
                    log.Warn("read failed. ending connection: " + _address, failed);
                }
            };
        }

        public UdpClient Client
        {
            get { return _client; }
        }

        public void Start()
        {
            _client.JoinMulticastGroup(_address);       
            _client.BeginReceive(_runner, null);
       }

        private void Receive(IAsyncResult result)
        {
                IPEndPoint endpoint = null;
                byte[] packet = _client.EndReceive(result, ref endpoint);
                OnReceive rcv = ReceiveEvent;
                if (rcv != null)
                {
                    rcv(endpoint, packet, 0, packet.Length);
                }
                _client.BeginReceive(_runner, null);
        }

       public void Dispose()
       {
           _running = false;
           _client.Close();
       }
    }
}
