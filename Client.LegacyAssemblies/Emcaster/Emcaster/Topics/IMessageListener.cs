namespace Emcaster.Topics
{
    public interface IMessageListener
    {
        void OnMessage(IMessageParser parser);
    }
}