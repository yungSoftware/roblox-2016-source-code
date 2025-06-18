using System;
using System.Text.RegularExpressions;

namespace Emcaster.Topics
{
    public class TopicSubscriber : IDisposable, ITopicSubscriber
    {
        public event OnTopicMessage TopicMessageEvent;

        private readonly Regex _regex;
        private readonly IMessageEvent _msgEvent;

        public TopicSubscriber(string topic, IMessageEvent msgEvent)
        {
            _regex = new Regex(topic, RegexOptions.Compiled);
            _msgEvent = msgEvent;
        }

        public void Start()
        {
            _msgEvent.MessageEvent += OnTopicMessage;
        }

        public void Stop()
        {
            Dispose();
        }

        public void Dispose()
        {
            _msgEvent.MessageEvent -= OnTopicMessage;
        }

        private void OnTopicMessage(IMessageParser parser)
        {
            OnTopicMessage msg = TopicMessageEvent;
            if (msg != null)
            {
                string topic = parser.Topic;
                if (_regex.IsMatch(parser.Topic))
                {
                    msg(parser);
                }
            }
        }
    }
}