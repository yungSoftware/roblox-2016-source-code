
using NUnit.Framework;
using Emcaster.Topics;
using System.Threading;

namespace EmcasterTest.Topics
{
    [TestFixture]
    public class TopicQueueSubscriberTests
    {

        public class SimpleSubscriber: ITopicSubscriber
        {
            public event OnTopicMessage TopicMessageEvent;

            public void PublishMessage(string topic, byte[] msg)
            {
                OnTopicMessage onData = TopicMessageEvent;
                if (onData != null)
                {
                    onData(new ByteMessageParser(topic, msg, null));
                }
           }
        }

        [Test]
        public void DequeueNothing()
        {
            ITopicSubscriber subscriber = new SimpleSubscriber();
            TopicQueueSubscriber queue = new TopicQueueSubscriber(subscriber, 10);
            queue.Start();
            Assert.AreEqual(0, queue.Dequeue(1).Count);
        }

        [Test]
        public void DequeueOne()
        {
            SimpleSubscriber subscriber = new SimpleSubscriber();
            TopicQueueSubscriber queue = new TopicQueueSubscriber(subscriber, 10);
            queue.Start();
            subscriber.PublishMessage("test", new byte[0]);
            Assert.AreEqual(1, queue.Dequeue(1).Count);
            queue.Stop();
            subscriber.PublishMessage("test", new byte[0]);
            Assert.AreEqual(0, queue.Dequeue(0).Count);
        }

        [Test]
        public void DequeueOnSeparateThread()
        {
            SimpleSubscriber subscriber = new SimpleSubscriber();
            TopicQueueSubscriber queue = new TopicQueueSubscriber(subscriber, 10);
            queue.Start();
            WaitCallback async = delegate{
                Thread.Sleep(100);
                subscriber.PublishMessage("test", new byte[0]);
            };
            ThreadPool.QueueUserWorkItem(async);
            Assert.AreEqual(1, queue.Dequeue(5000).Count);
            Assert.AreEqual(0, queue.Dequeue(1).Count);
        }

        [Test]
        public void Discard()
        {
            SimpleSubscriber subscriber = new SimpleSubscriber();
            TopicQueueSubscriber queue = new TopicQueueSubscriber(subscriber, 1);
            int discardCount = 0;
            queue.DiscardEvent += delegate
            {
                discardCount++;
            };
            queue.Start();
            subscriber.PublishMessage("test", new byte[0]);
            subscriber.PublishMessage("test", new byte[0]);
            Assert.AreEqual(1, discardCount);     
        }
    }
}
