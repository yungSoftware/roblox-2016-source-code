using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	public class ContentClass : IContent, Content
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		public virtual extern void Upload([In][MarshalAs(UnmanagedType.BStr)] string url);
	}
}
