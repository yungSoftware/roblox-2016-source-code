using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Roblox
{
    public static class HashFunctions
    {
        public static string HashToString(byte[] rawHash)
        {
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < 16; i++)
            {
                string twoChars = rawHash[i].ToString("x");
                if (twoChars.Length == 1)       // case of x0a for example
                    stringBuilder.AppendFormat("0{0}", twoChars);
                else
                    stringBuilder.AppendFormat(twoChars);
            }
            return stringBuilder.ToString();
        }
        public static byte[] ComputeHash(Stream buffer)
        {

            long pos = buffer.Position;
            buffer.Seek(0, SeekOrigin.Begin);

            byte[] result;
            using (var md5 = new MD5CryptoServiceProvider())
            {
                result = md5.ComputeHash(buffer);
            }

            buffer.Seek(pos, SeekOrigin.Begin);
            return result;
        }
        public static byte[] ComputeHash(byte[] data)
        {
            byte[] result;
            using (var md5 = new MD5CryptoServiceProvider())
            {
                result = md5.ComputeHash(data);
            }
            return result;
        }
        
        public static string ComputeHashString(byte[] data)
        {
            return HashToString(ComputeHash(data));
        }
        public static string ComputeHashString(Stream buffer)
        {
            return HashToString(ComputeHash(buffer));
        }
    }
}
