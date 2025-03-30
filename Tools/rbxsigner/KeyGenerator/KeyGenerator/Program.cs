using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Security.Cryptography;

namespace KeyGenerator
{
	internal class Program
	{
		private static void Main()
		{
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider(1024);
			byte[] inArray = rSACryptoServiceProvider.ExportCspBlob(false);
			byte[] array = rSACryptoServiceProvider.ExportCspBlob(true);
			rSACryptoServiceProvider.Dispose();
			int pcbEncoded = 0;
			if (!CryptoAPI.CryptEncodeObject(65536, 43, array, null, ref pcbEncoded))
			{
				Console.WriteLine("CryptEncodeObject failed: GetLastError() == {0}", Marshal.GetLastWin32Error());
				Console.ReadKey();
				return;
			}
			byte[] array2 = new byte[pcbEncoded];
			if (!CryptoAPI.CryptEncodeObject(65536, 43, array, array2, ref pcbEncoded))
			{
				Console.WriteLine("CryptEncodeObject failed: GetLastError() == {0}", Marshal.GetLastWin32Error());
				Console.ReadKey();
			}
			else
			{
				File.WriteAllText("PublicKeyBlob.txt", Convert.ToBase64String(inArray));
				File.WriteAllText("PrivateKeyBlob.txt", Convert.ToBase64String(array));
				File.WriteAllText("PrivateKey.pem", "-----BEGIN RSA PRIVATE KEY-----\r\n" + Convert.ToBase64String(array2) + "\r\n-----END RSA PRIVATE KEY-----");
			}
		}
	}
}
