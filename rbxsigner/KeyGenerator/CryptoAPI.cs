using System.Runtime.InteropServices;

internal static class CryptoAPI
{
	public const int PKCS_7_ASN_ENCODING = 65536;

	public const int PKCS_RSA_PRIVATE_KEY = 43;

	[DllImport("crypt32.dll", SetLastError = true)]
	public static extern bool CryptEncodeObject(int dwCertEncodingType, int lpszStructType, byte[] pvStructInfo, byte[] pbEncoded, ref int pcbEncoded);
}
