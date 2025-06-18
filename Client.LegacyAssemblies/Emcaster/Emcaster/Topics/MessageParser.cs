using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using Emcaster.Sockets;
using System.Net;

namespace Emcaster.Topics
{
    public unsafe class MessageParser : IMessageParser, IByteParser
    {
        private readonly UTF8Encoding _decoder = new UTF8Encoding();
        private string _topic;
        private object _object;
        private int _offset;

        private byte[] _buffer;
        private readonly IMessageListener _listener;
        private MessageHeader* _currentHeader;
        private EndPoint _endPoint;

        public MessageParser(IMessageListener listener)
        {
            _listener = listener;
        }

        public EndPoint EndPoint
        {
            get { return _endPoint; }
        }
    
        public string Topic
        {
            get
            {
                if (_topic == null)
                {
                    int topicSize = _currentHeader->TopicSize;
                    _topic = _decoder.GetString(_buffer, _offset + TopicPublisher.HEADER_SIZE, topicSize);
                }
                return _topic;
            }
        }

        public byte[] ParseBytes()
        {
            int size = _currentHeader->BodySize;
            if (size == 0)
            {
                return new byte[0];
            }
            byte[] result = new byte[size];
            int topicSize = _currentHeader->TopicSize;
            int totalOffset = _offset + topicSize + TopicPublisher.HEADER_SIZE;
            System.Array.Copy(_buffer, totalOffset, result, 0, size);
            return result;
        }

        public object ParseObject()
        {
            if (_object == null)
            {
                int bodySize = _currentHeader->BodySize;
                if (bodySize == 0)
                {
                    return null;
                }
                BinaryFormatter formatter = new BinaryFormatter();
                int topicSize = _currentHeader->TopicSize;
                int totalOffset = _offset + topicSize + TopicPublisher.HEADER_SIZE;
                MemoryStream stream = new MemoryStream(_buffer, totalOffset, bodySize);
                _object = formatter.Deserialize(stream);
            }
            return _object;
        }

        public void OnBytes(EndPoint endpoint, byte[] data, int offset, int length)
        {
            ParseBytes(endpoint, data, offset, length);
        }


        public unsafe void ParseBytes(EndPoint endpoint, byte[] buffer, int offset, int received)
        {
            _endPoint = EndPoint;
            _buffer = buffer;
            _offset = offset;
            fixed (byte* pArray = buffer)
            {
                while (_offset < received)
                {
                    _topic = null;
                    _object = null;
                    byte* pHeader = (pArray + _offset);
                    _currentHeader = (MessageHeader*)pHeader;
                    int msgSize = TopicPublisher.HEADER_SIZE + _currentHeader->TopicSize + _currentHeader->BodySize;
                    _listener.OnMessage(this);
                    _offset += msgSize;
                }
            }
        }
    }
}