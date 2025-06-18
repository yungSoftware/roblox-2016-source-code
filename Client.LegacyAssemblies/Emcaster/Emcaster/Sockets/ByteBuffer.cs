using System;
using System.Net.Sockets;

namespace Emcaster.Sockets
{
    public class ByteBuffer
    {
        private readonly byte[] _buffer;
        private int _position;

        public ByteBuffer(int size)
        {
            _buffer = new byte[size];
        }

        public void Write(byte[] data, int offset, int length)
        {
            Array.Copy(data, offset, _buffer, _position, length);
            _position += length;
        }

        public bool WriteTo(IByteWriter writer)
        {
            return writer.Write(_buffer, 0, _position, 0);
        }

        public int WriteTo(Socket socket, SocketFlags flags)
        {
            return socket.Send(_buffer, 0, _position, flags);
        }

        public int Length
        {
            get { return _position; }
        }

        public int Capacity
        {
            get { return _buffer.Length; }
        }

        public void Reset()
        {
            _position = 0;
        }
    }
}