using System;
using System.Net;
using System.Web;

namespace Roblox.Common
{
    public class Web
    {
        public static string AccessKey
        {
            get { return Roblox.Common.Properties.Settings.Default.AccessKey; }
        }

        private static readonly string _accessKeyParam = "accesskey";

        public static string ApplicationURL
        {
            get { return Roblox.WebsiteSettings.Properties.Settings.Default.ApplicationURL; }
        }

        public static WebResponse Get(Uri uri)
        {
            if (uri == default(Uri))
            {
                Roblox.ExceptionHandler.LogException("Invalid Parameter (URL) in Web.Get(Uri) method.", System.Diagnostics.EventLogEntryType.Error, "Roblox.Common.Web");
                return default(WebResponse);
            }
            var webRequest = WebRequest.Create(uri);
            var webResponse = webRequest.GetResponse();
            return webResponse;
        }
        public static DecompressionMethods ParseContentEncoding(HttpWebResponse response)
        {
            string encoding = response.Headers["Content-Encoding"];
            if (encoding != null)
            {
                switch (encoding.ToLower())
                {
                    case "gzip":
                        return DecompressionMethods.GZip;
                    case "deflate":
                        return DecompressionMethods.Deflate;
                }
            }
            return DecompressionMethods.None;
        }
        public static DecompressionMethods ParseContentEncoding(HttpRequest request)
        {
            string encoding = request.Headers["Content-Encoding"];
            if (encoding != null)
            {
                switch (encoding.ToLower())
                {
					case "gzip":
						return DecompressionMethods.GZip;
					case "deflate":
						return DecompressionMethods.Deflate;
                }
            }
            return DecompressionMethods.None;
        }
        public static WebResponse Post(Uri uri, byte[] data, string contentType)
        {
            var webRequest = WebRequest.Create(uri);
            webRequest.Method = "POST";
            webRequest.ContentType = contentType;

            using (var requestStream = webRequest.GetRequestStream())
            {
                requestStream.Write(data, 0, data.Length);
            }

            var webResponse = webRequest.GetResponse();
            return webResponse;
        }
        public static string ResolveWithDomain(HttpContext context, string url)
        {
            return ResolveWithDomain(context.Request, url);
        }
        public static string ResolveWithDomain(HttpRequest request, string url)
        {
            return ResolveWithDomain(request, url, request.IsSecureConnection);
        }
        public static string ResolveWithDomain(HttpContext context, string url, bool ssl)
        {
            return ResolveWithDomain(context.Request, url, ssl);
        }
        public static string ResolveWithDomain(HttpRequest request, string url, bool ssl)
        {
            string[] parts = url.Split('?');
            string result = string.Format("{0}{1}", request.Url.GetLeftPart(UriPartial.Authority), VirtualPathUtility.ToAbsolute(parts[0]));
            //string result = ApplicationURL + VirtualPathUtility.ToAbsolute(parts[0]);

            if (parts.Length != 1)
                result = string.Format("{0}?{1}", result, parts[1]);

            if (ssl)
            {
                if (result.StartsWith("http:"))
                    result = string.Format("https{0}", result.Substring(4));
            }
            else
            {
                if (result.StartsWith("https:"))
                    result = string.Format("http{0}", result.Substring(5));
            }
            return result;
        }
        public static bool VerifyAccessKeyID(string accessKeyId)
        {
            if (accessKeyId != AccessKey)
                return false;
            else
                return true;
        }

        public static string GetAccessKey(HttpRequest request)
        {
            return request.Headers.Get(_accessKeyParam);
        }
    }
}
