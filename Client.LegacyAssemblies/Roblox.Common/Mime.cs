using System;
using System.IO;
using System.Text;
using System.Net.Mime;
using System.Net.Mail;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Text.RegularExpressions;

namespace Roblox.Common.Mime
{
    public static class MediaTypes
    {
        public static readonly string Multipart = "multipart";
        public static readonly string Mixed = "mixed";
        public static readonly string Alternative = "alternative";
        public static readonly string MultipartMixed = Multipart + "/" + Mixed;
        public static readonly string MultipartAlternative = Multipart + "/" + Alternative;
        public static readonly string TextPlain = "text/plain";
        public static readonly string TextHtml = "text/html";
        public static readonly string TextRich = "text/richtext";
        public static readonly string TextXml = "text/xml";
        public static readonly string Message = "message";
        public static readonly string Rfc822 = "rfc822";
        public static readonly string MessageRfc822 = Message + "/" + Rfc822;
        public static readonly string Application = "application";
    }

    public static class MimeHeaders
    {
        public const string ContentDescription = "content-description";
        public const string ContentDisposition = "content-disposition";
        public const string ContentId = "content-id";
        public const string ContentTransferEncoding = "content-transfer-encoding";
        public const string ContentType = "content-type";
        public const string MimeVersion = "mime-version";
    }

    public class QuotedPrintableEncoding
    {
        private static string HexDecoderEvaluator(Match m) => ((char)Convert.ToInt32(m.Groups[2].Value, 16)).ToString();
        private static string HexDecoder(string line)
        {
            if (line == null) throw new ArgumentNullException();

            return new Regex(@"(\=([0-9A-F][0-9A-F]))", RegexOptions.IgnoreCase).Replace(line, HexDecoderEvaluator);
        }
        public static string DecodeFile(string filepath)
        {
            if (filepath == null) throw new ArgumentNullException();

            var fileInfo = new FileInfo(filepath);
            if (!fileInfo.Exists) throw new FileNotFoundException();

            var streamReader = fileInfo.OpenText();

            try
            {
                string encoded;
                string result = string.Empty;
                while ((encoded = streamReader.ReadLine()) != null) result += Decode(encoded);
                return result;
            }
            finally
            {
                streamReader.Close();
            }
        }
        public static string Decode(string encoded)
        {
            if (encoded == null) throw new ArgumentNullException();

            using (var stringWriter = new StringWriter())
            {
                using (var stringReader = new StringReader(encoded))
                {
                    string line;
                    while ((line = stringReader.ReadLine()) != null)
                    {
                        if (line.EndsWith("=")) stringWriter.Write(HexDecoder(line.Substring(0, line.Length - 1)));
                        else stringWriter.WriteLine(HexDecoder(line));
                        stringWriter.Flush();
                    }
                }

                return stringWriter.ToString();
            }
        }
    }

    public class MimeReader
    {
        public const string Crlf = "\r\n";
        private static readonly char[] HeaderWhitespaceChars = new[] { ' ', '\t' };
        private Queue<string> _lines;
        private MimeEntity _entity;

        private MimeReader()
        {
            _entity = new MimeEntity();
        }
        private MimeReader(MimeEntity entity, Queue<string> lines)
            : this()
        {
            if (entity == null) throw new ArgumentNullException(nameof(entity));
            if (lines == null) throw new ArgumentNullException(nameof(lines));
            _lines = lines;
            _entity = new MimeEntity(entity);
        }
        public MimeReader(string[] lines)
            : this()
        {
            if (lines == null) throw new ArgumentNullException(nameof(lines));
            _lines = new Queue<string>(lines);
        }

        private int ParseHeaders()
        {
            var name = string.Empty;
            var line = string.Empty;
            while (_lines.Count > 0 && !string.IsNullOrEmpty(_lines.Peek()))
            {
                line = _lines.Dequeue();
                if (line.StartsWith(" ") || line.StartsWith(Convert.ToString('\t')))
                    _entity.Headers[name] = _entity.Headers[name] + line;
                else
                {
                    var idx = line.IndexOf(':');
                    if (idx >= 0)
                    {
                        var key = line.Substring(0, idx);
                        var value = line.Substring(idx + 1).Trim(HeaderWhitespaceChars);
                        _entity.Headers.Add(key.ToLower(), value);
                        name = key;
                    }
                }
            }
            if (_lines.Count > 0) _lines.Dequeue();
            return _entity.Headers.Count;
        }
        private void ProcessHeaders()
        {
            foreach (var headerName in _entity.Headers.AllKeys)
            {
                switch (headerName)
                {
                    case MimeHeaders.ContentDescription:
                        _entity.ContentDescription = _entity.Headers[headerName];
                        break;
                    case MimeHeaders.ContentDisposition:
                        _entity.ContentDisposition = new ContentDisposition(_entity.Headers[headerName]);
                        break;
                    case MimeHeaders.ContentId:
                        _entity.ContentId = _entity.Headers[headerName];
                        break;
                    case MimeHeaders.ContentTransferEncoding:
                        _entity.TransferEncoding = _entity.Headers[headerName];
                        _entity.ContentTransferEncoding = GetTransferEncoding(_entity.Headers[headerName]);
                        break;
                    case MimeHeaders.ContentType:
                        _entity.SetContentType(GetContentType(_entity.Headers[headerName]));
                        break;
                    case MimeHeaders.MimeVersion:
                        _entity.MimeVersion = _entity.Headers[headerName];
                        break;
                }
            }
        }
        public MimeEntity CreateMimeEntity()
        {
            ParseHeaders();
            ProcessHeaders();
            ParseBody();
            SetDecodedContentStream();
            return _entity;
        }
        private void SetDecodedContentStream()
        {
            switch (_entity.ContentTransferEncoding)
            {
                case TransferEncoding.QuotedPrintable:
                    _entity.Content = new MemoryStream(GetBytes(QuotedPrintableEncoding.Decode(_entity.EncodedMessage.ToString())), false);
                    return;
                case TransferEncoding.Base64:
                    _entity.Content = new MemoryStream(Convert.FromBase64String(_entity.EncodedMessage.ToString()), false);
                    return;
            }
            _entity.Content = new MemoryStream(GetBytes(_entity.EncodedMessage.ToString()), false);
        }
        private byte[] GetBytes(string content)
        {
            using (var stream = new MemoryStream())
            {
                using (var streamWriter = new StreamWriter(stream)) streamWriter.Write(content);
                return stream.ToArray();
            }
        }
        private void ParseBody()
        {
            if (_entity.HasBoundry)
            {
                while (_lines.Count > 0)
                {
                    if (string.Equals(_lines.Peek(), _entity.EndBoundry)) return;
                    if (_entity.Parent != null && string.Equals(_entity.Parent.StartBoundry, _lines.Peek())) return;
                    if (string.Equals(_lines.Peek(), _entity.StartBoundry)) AddChildEntity(_entity, _lines);
                    else
                    {
                        if (string.Equals(_entity.ContentType.MediaType, MediaTypes.MessageRfc822, StringComparison.InvariantCultureIgnoreCase) && string.Equals(_entity.ContentDisposition.DispositionType, "attachment", StringComparison.InvariantCultureIgnoreCase))
                        {
                            AddChildEntity(_entity, _lines);
                            return;
                        }
                        _entity.EncodedMessage.Append(_lines.Dequeue() + Crlf);
                    }
                }
            }
            else
            {
                while (_lines.Count > 0) _entity.EncodedMessage.Append(_lines.Dequeue() + Crlf);
            }
        }
        private void AddChildEntity(MimeEntity entity, Queue<string> lines)
        {
            var reader = new MimeReader(entity, lines);
            entity.Children.Add(reader.CreateMimeEntity());
        }
        public static ContentType GetContentType(string contentType)
        {
            if (string.IsNullOrEmpty(contentType)) contentType = "text/plain; charset=us-ascii";
            return new ContentType(contentType);
        }
        public static string GetMediaType(string mediaType)
        {
            if (string.IsNullOrEmpty(mediaType)) return MediaTypes.TextPlain;
            return mediaType.Trim();
        }
        public static string GetMediaMainType(string mediaType)
        {
            var idx = mediaType.IndexOf('/');
            if (idx < 0) return mediaType;
            return mediaType.Substring(0, idx);
        }
        public static string GetMediaSubType(string mediaType)
        {
            var idx = mediaType.IndexOf('/');
            if (idx < 0)
            {
                if (mediaType.Equals("text")) return "plain";
                return string.Empty;
            }

            if (mediaType.Length > idx) return mediaType.Substring(idx + 1);
            if (GetMediaMainType(mediaType).Equals("text")) return "plain";
            return string.Empty;
        }
        public static TransferEncoding GetTransferEncoding(string transferEncoding)
        {
            var a = transferEncoding.Trim().ToLowerInvariant();
            switch (a)
            {
                case "7bit":
                case "8bit":
                    return TransferEncoding.SevenBit;
                case "quoted-printable":
                    return TransferEncoding.QuotedPrintable;
                case "base64":
                    return TransferEncoding.Base64;
                default:
                    return TransferEncoding.Unknown;
            }
        }
    }

    public class MimeEntity
    {
        private StringBuilder _encodedMessage;
        private List<MimeEntity> _children;
        private ContentType _contentType;
        private string _mediaSubType;
        private string _mediaMainType;
        private NameValueCollection _headers;
        private string _mimeVersion;
        private string _contentId;
        private string _contentDescription;
        private ContentDisposition _contentDisposition;
        private string _transferEncoding;
        private TransferEncoding _contentTransferEncoding;
        private string _startBoundry;
        private MimeEntity _parent;
        private MemoryStream _content;

        public MimeEntity()
        {
            _children = new List<MimeEntity>();
            _headers = new NameValueCollection();
            _contentType = MimeReader.GetContentType(string.Empty);
            _parent = null;
            _encodedMessage = new StringBuilder();
        }
        public MimeEntity(MimeEntity parent)
            : this()
        {
            if (parent == null) throw new ArgumentNullException(nameof(parent));
            _parent = parent;
            _startBoundry = parent.StartBoundry;
        }

        public StringBuilder EncodedMessage { get { return _encodedMessage; } }
        public List<MimeEntity> Children { get { return _children; } }
        public ContentType ContentType { get { return _contentType; } }
        public string MediaSubType { get { return _mediaSubType; } }
        public string MediaMainType { get { return _mediaMainType; } }
        public NameValueCollection Headers { get { return _headers; } }
        public string MimeVersion { get { return _mimeVersion; } set { _mimeVersion = value; } }
        public string ContentId { get { return _contentId; } set { _contentId = value; } }
        public string ContentDescription { get { return _contentDescription; } set { _contentDescription = value; } }
        public ContentDisposition ContentDisposition { get { return _contentDisposition; } set { _contentDisposition = value; } }
        public string TransferEncoding { get { return _transferEncoding; } set { _transferEncoding = value; } }
        public TransferEncoding ContentTransferEncoding { get { return _contentTransferEncoding; } set { _contentTransferEncoding = value; } }
        public bool HasBoundry { get { return !string.IsNullOrEmpty(_contentType.Boundary) || !string.IsNullOrEmpty(_startBoundry); } }
        public string StartBoundry
        {
            get
            {
                if (string.IsNullOrEmpty(_startBoundry) || !string.IsNullOrEmpty(_contentType.Boundary))
                    return "--" + _contentType.Boundary;
                return _startBoundry;
            }
        }
        public string EndBoundry { get { return StartBoundry + "--"; } }
        public MimeEntity Parent { get { return _parent; } set { _parent = value; } }
        public MemoryStream Content { get { return _content; } set { _content = value; } }

        internal void SetContentType(ContentType contentType)
        {
            _contentType = contentType;
            _contentType.MediaType = MimeReader.GetMediaType(contentType.MediaType);
            _mediaMainType = MimeReader.GetMediaMainType(contentType.MediaType);
            _mediaSubType = MimeReader.GetMediaSubType(contentType.MediaType);
        }
        public MailMessageEx ToMailMessageEx() => ToMailMessageEx(this);
        public MailMessageEx ToMailMessageEx(MimeEntity entity)
        {
            if (entity == null) throw new ArgumentNullException(nameof(entity));
            var mailMessage = MailMessageEx.CreateMailMessageFromEntity(entity);
            if (!string.IsNullOrEmpty(entity.ContentType.Boundary))
            {
                mailMessage = MailMessageEx.CreateMailMessageFromEntity(entity);
                BuildMultiPartMessage(entity, mailMessage);
            }
            else if (string.Equals(entity.ContentType.MediaType, MediaTypes.MessageRfc822, StringComparison.InvariantCultureIgnoreCase))
            {
                if (entity.Children.Count < 0) throw new ApplicationException("Invalid child count on message/rfc822 entity.");
                mailMessage = MailMessageEx.CreateMailMessageFromEntity(entity.Children[0]);
                BuildMultiPartMessage(entity, mailMessage);
            }
            else
            {
                mailMessage = MailMessageEx.CreateMailMessageFromEntity(entity);
                BuildSinglePartMessage(entity, mailMessage);
            }
            return mailMessage;
        }
        private void BuildSinglePartMessage(MimeEntity entity, MailMessageEx message) { SetMessageBody(message, entity); }
        public Encoding GetEncoding()
        {
            if (string.IsNullOrEmpty(ContentType.CharSet)) return Encoding.ASCII;
            try { return Encoding.GetEncoding(ContentType.CharSet); }
            catch (ArgumentException) { return Encoding.ASCII; }
        }
        private void BuildMultiPartMessage(MimeEntity entity, MailMessageEx message)
        {
            foreach (var mimeEntity in entity.Children)
            {
                if (string.Equals(mimeEntity.ContentType.MediaType, MediaTypes.MultipartAlternative, StringComparison.InvariantCultureIgnoreCase) || string.Equals(mimeEntity.ContentType.MediaType, MediaTypes.MultipartMixed, StringComparison.InvariantCultureIgnoreCase))
                    BuildMultiPartMessage(mimeEntity, message);
                else if (IsAttachment(mimeEntity) && (string.Equals(mimeEntity.ContentType.MediaType, MediaTypes.TextPlain) || string.Equals(mimeEntity.ContentType.MediaType, MediaTypes.TextHtml)))
                {
                    message.AlternateViews.Add(CreateAlternateView(mimeEntity));
                    SetMessageBody(message, mimeEntity);
                }
                else if (string.Equals(mimeEntity.ContentType.MediaType, MediaTypes.MessageRfc822, StringComparison.InvariantCultureIgnoreCase) && string.Equals(mimeEntity.ContentDisposition.DispositionType, "attachment", StringComparison.InvariantCultureIgnoreCase))
                    message.Children.Add(ToMailMessageEx(mimeEntity));
                else if (IsAttachment(mimeEntity))
                    message.Attachments.Add(CreateAttachment(mimeEntity));
            }
        }
        private static bool IsAttachment(MimeEntity child) => child.ContentDisposition != null && string.Equals(child.ContentDisposition.DispositionType, "attachment", StringComparison.InvariantCultureIgnoreCase);
        private void SetMessageBody(MailMessageEx message, MimeEntity child)
        {
            var encoding = child.GetEncoding();
            message.Body = DecodeBytes(child.Content.ToArray(), encoding);
            message.BodyEncoding = encoding;
            message.IsBodyHtml = string.Equals(MediaTypes.TextHtml, child.ContentType.MediaType, StringComparison.InvariantCultureIgnoreCase);
        }
        private string DecodeBytes(byte[] buffer, Encoding encoding)
        {
            if (buffer == null) return null;
            if (encoding == null) encoding = Encoding.UTF7;
            return encoding.GetString(buffer);
        }
        private AlternateView CreateAlternateView(MimeEntity view)
        {
            return new AlternateView(view.Content, view.ContentType)
            {
                TransferEncoding = view.ContentTransferEncoding,
                ContentId = TrimBrackets(view.ContentId)
            };
        }
        public static string TrimBrackets(string value)
        {
            if (value == null) return value;
            if (value.StartsWith("<") && value.EndsWith(">"))
                return value.Trim(new[] { '<', '>' });
            return value;
        }
        private Attachment CreateAttachment(MimeEntity entity)
        {
            var attachment = new Attachment(entity.Content, entity.ContentType);
            if (entity.ContentDisposition != null)
            {
                attachment.ContentDisposition.Parameters.Clear();
                foreach (var k in entity.ContentDisposition.Parameters.Keys)
                {
                    var key = (string)k;
                    attachment.ContentDisposition.Parameters.Add(key, entity.ContentDisposition.Parameters[key]);
                }
                attachment.ContentDisposition.CreationDate = entity.ContentDisposition.CreationDate;
                attachment.ContentDisposition.DispositionType = entity.ContentDisposition.DispositionType;
                attachment.ContentDisposition.FileName = entity.ContentDisposition.FileName;
                attachment.ContentDisposition.Inline = entity.ContentDisposition.Inline;
                attachment.ContentDisposition.ModificationDate = entity.ContentDisposition.ModificationDate;
                attachment.ContentDisposition.ReadDate = entity.ContentDisposition.ReadDate;
                attachment.ContentDisposition.Size = entity.ContentDisposition.Size;
            }
            if (!string.IsNullOrEmpty(entity.ContentId))
                attachment.ContentId = TrimBrackets(entity.ContentId);
            attachment.TransferEncoding = entity.ContentTransferEncoding;
            return attachment;
        }
    }
}
