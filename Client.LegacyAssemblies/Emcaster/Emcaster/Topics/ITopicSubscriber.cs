
namespace Emcaster.Topics
{
    public delegate void OnTopicMessage(IMessageParser parser);

    public interface ITopicSubscriber
    {

        event OnTopicMessage TopicMessageEvent;

    }
}
