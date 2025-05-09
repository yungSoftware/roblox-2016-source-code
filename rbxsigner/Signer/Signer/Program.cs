using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using IniParser;

namespace Signer
{
	internal class Program
	{
		private static void Main(string[] args)
		{
			string format = (Convert.ToBoolean(new FileIniDataParser().ReadFile("Signer.ini").GetKey("UseNewSignatureFormat")) ? "--rbxsig%{0}%{1}" : "%{0}%{1}");
			byte[] keyBlob = Convert.FromBase64String(File.ReadAllText("PrivateKeyBlob.txt"));
			SHA1CryptoServiceProvider sHA1CryptoServiceProvider = new SHA1CryptoServiceProvider();
			RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider(1024);
			rSACryptoServiceProvider.ImportCspBlob(keyBlob);
			foreach (string text in args)
			{
				Console.WriteLine("Signing \"{0}\"...", text);
				string text2 = "\r\n" + File.ReadAllText(text);
				byte[] inArray = rSACryptoServiceProvider.SignData(Encoding.ASCII.GetBytes(text2), sHA1CryptoServiceProvider);
				File.WriteAllText(text + ".signed", string.Format(format, Convert.ToBase64String(inArray), text2));
			}
			sHA1CryptoServiceProvider.Dispose();
			rSACryptoServiceProvider.Dispose();
		}
	}
}
