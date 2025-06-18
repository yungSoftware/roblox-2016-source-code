namespace Emcaster.Sockets
{
    public interface IByteWriter
    {
        bool Write(byte[] data, int offset, int length, int msToWaitForWriteLock);

        void Start();
    }
}