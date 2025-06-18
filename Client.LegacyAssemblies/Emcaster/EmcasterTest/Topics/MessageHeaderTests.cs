using Emcaster.Topics;
using NUnit.Framework;
using System.Runtime.InteropServices;

namespace EmcasterTest.Topics
{
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    public struct MyHeader
    {
        //public string Topic;
        //public byte[] body;   
    }

    [TestFixture]
    public class MessageHeaderTests
    {
        [Test]
        public unsafe void Serialize()
        {
            int size = sizeof(MyHeader);
            MyHeader header = new MyHeader();
            //header.Topic ="mytopic";
            //header.body = new byte[7];
            //header.body[4] = 6;
            byte[] result = new byte[size];
            fixed (byte* pBytes = &result[0])
            {
                *((MyHeader*)pBytes) = header;
            }

        }

        [Test]
        public unsafe void Buffer()
        {
            MessageHeader header = new MessageHeader(10, 20);
            Assert.AreEqual(30, header.TotalSize);
            int size = sizeof (MessageHeader);
            byte[] buffer = new byte[size];
            header.WriteToBuffer(buffer);
            fixed (byte* pBytes = &buffer[0])
            {
                MessageHeader* hdr = (MessageHeader*) pBytes;
                Assert.AreEqual(30, hdr->TotalSize);
            }
        }

        [Test]
        [Explicit]
        public unsafe void WriteToBufferPerf()
        {
            MessageHeader header = new MessageHeader(10, 20);
            Assert.AreEqual(30, header.TotalSize);
            int size = sizeof(MessageHeader);
            byte[] buffer = new byte[size];
            for (int i = 0; i < 50000000; i++)
            {
                header.WriteToBuffer(buffer);
            }
        }
    }
}