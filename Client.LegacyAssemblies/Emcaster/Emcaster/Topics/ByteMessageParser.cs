using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Net;

namespace Emcaster.Topics
{
    public class ByteMessageParser:IMessageParser
    {
        private readonly string _topic;
        private readonly byte[] _body;
        private readonly EndPoint _endpoint;

        public ByteMessageParser(string topic, byte[] body, EndPoint endpoint)
        {
            _topic = topic;
            _body = body;
            _endpoint = endpoint;
        }

        public EndPoint EndPoint
        {
            get { return _endpoint; }
        }

        public string Topic
        {
            get { return _topic; }
        }

        public object ParseObject()
        {
            BinaryFormatter formatter = new BinaryFormatter();
            MemoryStream stream = new MemoryStream(ParseBytes());
            return formatter.Deserialize(stream);
        }
        public byte[] ParseBytes()
        {
            return _body;
        }
    }
}
