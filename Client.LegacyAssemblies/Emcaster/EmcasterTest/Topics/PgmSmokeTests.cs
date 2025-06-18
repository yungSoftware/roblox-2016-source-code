using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Text;
using System.Threading;
using Common.Logging;
using Common.Logging.Simple;
using NUnit.Framework;

using Emcaster.Topics;
using Emcaster.Sockets;

namespace EmcasterTest.Explicit
{

    [TestFixture]
    [Explicit]
    public class PgmSmokeTests
    {

        [Test]
        public void PubSubTest()
        {
            LogManager.Adapter = new ConsoleOutLoggerFactoryAdapter(new NameValueCollection());
            IList<ByteMessageParser> msgsReceived = new List<ByteMessageParser>();
            MessageParserFactory msgParser = new MessageParserFactory();
            PgmReader reader = new PgmReader(msgParser);
            PgmReceiver receiveSocket = new PgmReceiver("224.0.0.23", 40001, reader);

            TopicSubscriber topicSubscriber = new TopicSubscriber(".*", msgParser);
            topicSubscriber.Start();
            receiveSocket.Start();
            topicSubscriber.TopicMessageEvent += delegate(IMessageParser parser){
                msgsReceived.Add(new ByteMessageParser(parser.Topic, parser.ParseBytes(), parser.EndPoint));
            };


            PgmSource sendSocket = new PgmSource("224.0.0.23", 40001);
            sendSocket.Start();
            BatchWriter asyncWriter = new BatchWriter(sendSocket, 1024 * 64);
            TopicPublisher topicPublisher = new TopicPublisher(asyncWriter);
            topicPublisher.Start();

            Thread.Sleep(1000);

            for(int i = 0; i < 10; i++)
	            topicPublisher.PublishObject(i+"", i, 1000);

            Thread.Sleep(3000);

            sendSocket.Dispose();
            receiveSocket.Dispose();	

            Assert.AreEqual(10, msgsReceived.Count);
            Assert.AreEqual(0, msgsReceived[0].ParseObject());
            Assert.AreEqual(9, msgsReceived[9].ParseObject());
            for (int i = 0; i < msgsReceived.Count; i++)
            {
                Assert.AreEqual(i +"", msgsReceived[i].Topic);
            }
        }
    }
}
