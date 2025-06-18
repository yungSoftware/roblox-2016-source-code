using System;

namespace Roblox.RSS
{
    public interface IItem
    {
        string Title { get; }
        DateTime PubDate { get; }
        string Description { get; }
        string Link { get; }
        IImage Image { get; }
    }

    public class StandardFeedImage : IImage
    {
        private string url;

        public StandardFeedImage(string url)
        {
            this.url = url;
        }

        public int Width { get { return 118; } }
        public int Height { get { return 31; } }
        public string Url { get { return url; } }
    }

	public class CustomImage : IImage
	{
        private string url;
        private int width;
        private int height;

        public CustomImage(string url, int width, int height)
		{
			this.url = url;
			this.width = width;
			this.height = height;
		}

		public string Url { get { return url; } }
        public int Width { get { return width; } }
        public int Height { get { return height; } }
	}
}
