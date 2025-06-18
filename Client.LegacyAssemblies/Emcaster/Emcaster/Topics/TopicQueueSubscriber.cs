using System.Collections.Generic;
using System.Threading;

namespace Emcaster.Topics
{

    public class TopicQueueSubscriber
    {
        public event OnTopicMessage DiscardEvent;

        private readonly object _lock = new object();

        private readonly ITopicSubscriber _topic;
        private List<ITopicMessage> _msgQueue = new List<ITopicMessage>();
        private readonly int _maxSize;

        public TopicQueueSubscriber(ITopicSubscriber topic, int maxSize)
        {
            _topic = topic;
            _maxSize = maxSize;
        }

        public void Start()
        {
            _topic.TopicMessageEvent += OnMessage;
        }

        public void Stop()
        {
            _topic.TopicMessageEvent -= OnMessage;
        }

        private void OnMessage(IMessageParser parser)
        {
            ByteMessageParser bytes = new ByteMessageParser(parser.Topic, parser.ParseBytes(), parser.EndPoint);
            bool discard = false;
            lock (_lock)
            {
                if (_msgQueue.Count >= _maxSize)
                {
                    discard = true;
                }
                else
                {
                    _msgQueue.Add(bytes);
                    Monitor.Pulse(_lock);
                }
            }
            OnTopicMessage discardMsg = DiscardEvent;
            if (discard && discardMsg != null)
            {
                discardMsg(bytes);
            }
        }

        /// <summary>
        /// Gets all queued messages. If no messages are available, the thread will wait the 
        /// provided wait time for a message.
        /// </summary>
        /// <param name="waitTimeMs"></param>
        /// <returns></returns>
        public IList<ITopicMessage> Dequeue(int waitTimeMs)
        {
            lock (_lock)
            {
                if (_msgQueue.Count > 0)
                {
                    IList<ITopicMessage> toReturn = _msgQueue;
                    _msgQueue = new List<ITopicMessage>();
                    return toReturn;
                }
                else
                {
                    Monitor.Wait(_lock, waitTimeMs);
                    IList<ITopicMessage> toReturn = _msgQueue;
                    _msgQueue = new List<ITopicMessage>();
                    return toReturn;
                }
            }
        }
    }
}
