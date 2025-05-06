using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("CC40955B-B371-4516-A776-CF1236E0F2A5")]
	[TypeLibType(4288)]
	public interface IContent
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		void Upload([In][MarshalAs(UnmanagedType.BStr)] string url);
	}
}
