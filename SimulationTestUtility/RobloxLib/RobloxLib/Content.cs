using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("CC40955B-B371-4516-A776-CF1236E0F2A5")]
	[CoClass(typeof(ContentClass))]
	public interface Content : IContent
	{
	}
}
