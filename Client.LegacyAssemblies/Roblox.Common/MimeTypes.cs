using Microsoft.Win32;

namespace Roblox.Common
{
    public class MimeTypes
    {
        public static string GetExtensionFromMime(string mimeType)
        {
            try
            {
                var regKey = Registry.ClassesRoot.OpenSubKey($@"Mime\Database\Content Type\{mimeType}", false);
                if (regKey == null) return null;

                var ext = regKey.GetValue("Extension") as string;
                if (string.IsNullOrEmpty(ext)) return string.Empty;

                return ext;
            }
            catch { return string.Empty; }
        }
        public static string GetMimeFromExtension(string ext)
        {
            var regKey = Registry.ClassesRoot.OpenSubKey(ext, false);
            if (regKey == null) return null;

            return regKey.GetValue("Content Type") as string;
        }
    }

}
