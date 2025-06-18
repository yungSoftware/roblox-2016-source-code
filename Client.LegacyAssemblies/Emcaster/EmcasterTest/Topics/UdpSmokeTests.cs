using System;
using System.Collections.Generic;
using System.Threading;

using NUnit.Framework;

using Emcaster.Sockets;
using Emcaster.Topics;

namespace EmcasterTest.Explicit
{
    [TestFixture]
    public class UdpSmokeTests
    {
        [Test]
        [Explicit]
        public void PubSubTest()
        {
            IList<object> msgsReceived = new List<object>();
            MessageParserFactory factory = new MessageParserFactory();
            MessageParser parser = factory.Create();
            UdpReceiver receiveSocket = new UdpReceiver("224.0.0.23", 40001);
            receiveSocket.ReceiveEvent += parser.OnBytes;

            TopicSubscriber topicSubscriber = new TopicSubscriber("MSFT", factory);
            topicSubscriber.Start();
            receiveSocket.Start();
            topicSubscriber.TopicMessageEvent += delegate(IMessageParser msgParser)
            {
                msgsReceived.Add(msgParser.ParseObject());
            };


            UdpSource sendSocket = new UdpSource("224.0.0.23", 40001);
            sendSocket.Start();
            BatchWriter asyncWriter = new BatchWriter(sendSocket, 1500);
            TopicPublisher topicPublisher = new TopicPublisher(asyncWriter);
            topicPublisher.Start();

            Thread.Sleep(1000);

            for (int i = 0; i < 10; i++)
                topicPublisher.PublishObject("MSFT", i, 1000);

            Thread.Sleep(3000);

            sendSocket.Dispose();
            receiveSocket.Dispose();

            Assert.AreEqual(10, msgsReceived.Count);
            Assert.AreEqual(0, msgsReceived[0]);
            Assert.AreEqual(9, msgsReceived[9]);
        }

    }
}
