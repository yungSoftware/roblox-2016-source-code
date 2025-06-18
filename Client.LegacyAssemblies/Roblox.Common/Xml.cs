using System;
using System.IO;
using System.Text;
using System.Xml;

namespace Roblox.Common
{
    public abstract class XmlBase
    {
        protected abstract XmlWriterSettings XmlWriterSettings { get; }

        private bool IsLegalCharacter(int character)
            => character == 9 || character == 10 || character == 13 || character >= 32 && character <= 55295 ||
               character >= 57344 && character <= 65533 || character >= 65536 && character <= 1114111;

        public string Sanitize(string xmlString)
        {
            if (string.IsNullOrEmpty(xmlString)) return xmlString;
            var builder = new StringBuilder(xmlString.Length);
            foreach (var c in xmlString)
                if (IsLegalCharacter((int) c))
                    builder.Append(c);

            return builder.ToString();
        }

        public virtual byte[] Write(Action<XmlWriter> write)
        {
            using (var ms = new MemoryStream())
            {
                using (var writer = XmlWriter.Create(ms, XmlWriterSettings))
                {
                    write(writer);
                    writer.Flush();
                    ms.Seek(0, SeekOrigin.Begin);
                    return ms.ToArray();
                }
            }
        }
    }
    
    public class Xml : XmlBase
    {
        protected override XmlWriterSettings XmlWriterSettings => _XmlWriterSettings;

        private Xml() {}

        private static XmlWriterSettings _XmlWriterSettings = new XmlWriterSettings
        {
            Encoding = Encoding.UTF8
        };

        public static Xml Singleton = new Xml();
    }
}
