using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using Emcaster.Sockets;

namespace Emcaster.Topics
{
    public class TopicPublisher
    {
        private readonly UTF8Encoding _encoder = new UTF8Encoding();
        private readonly IByteWriter _writer;
        public static readonly int HEADER_SIZE = CalculateHeaderSize();

        public TopicPublisher(IByteWriter writer)
        {
            _writer = writer;
        }

        public static unsafe int CalculateHeaderSize()
        {
            return sizeof (MessageHeader);
        }

        public void Start()
        {
            _writer.Start();
        }

        public void PublishObject(string topic, object data, int msToWaitForWriteLock)
        {
            byte[] allData = ToBytes(data);
            Publish(topic, allData, 0, allData.Length, msToWaitForWriteLock);
        }

        private static byte[] ToBytes(object obj)
        {
            if (obj == null)
            {
                return new byte[0];
            }
            BinaryFormatter formatter = new BinaryFormatter();
            MemoryStream outputStream = new MemoryStream();
            formatter.Serialize(outputStream, obj);
            return outputStream.ToArray();
        }

        public static byte[] CreateMessage(string topic, byte[] data, int offset, int length, UTF8Encoding encoder)
        {
            byte[] topicBytes = encoder.GetBytes(topic);
            MessageHeader header = new MessageHeader(topicBytes.Length, length);
            int totalSize = HEADER_SIZE + header.TotalSize;
            byte[] allData = new byte[totalSize];
            header.WriteToBuffer(allData);
            Array.Copy(topicBytes, 0, allData, HEADER_SIZE, topicBytes.Length);
            Array.Copy(data, offset, allData, HEADER_SIZE + topicBytes.Length, length);
            return allData;
        }

        public unsafe bool Publish(string topic, byte[] data, int offset, int length, int msToWaitForWriteLock)
        {
            byte[] allData = CreateMessage(topic, data, offset, length, _encoder);
            return _writer.Write(allData, 0, allData.Length, msToWaitForWriteLock);
        }
    }
}