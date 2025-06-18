namespace EmcasterTest
{
    public class SocketMonitor
    {
        private long _msgsReceived;
        private long _bytesReceived;


        public void OnReceive(byte[] data, int offset, int length)
        {
            _msgsReceived++;
            _bytesReceived += length;
        }

        public long MessagesReceived
        {
            get { return _msgsReceived; }
        }

        public long BytesReceived
        {
            get { return _bytesReceived; }
        }
    }
}