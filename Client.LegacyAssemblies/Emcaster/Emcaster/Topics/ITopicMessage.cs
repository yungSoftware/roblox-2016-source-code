namespace Emcaster.Topics
{
    public interface ITopicMessage
    {
        System.Net.EndPoint EndPoint{ get; }

        string Topic { get; }

        object ParseObject();
        byte[] ParseBytes();
    }
}
