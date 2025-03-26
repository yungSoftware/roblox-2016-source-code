using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	public class AppClass : IApp, App
	{
		[DispId(4)]
		public virtual extern string Version
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(4)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(11)]
		public virtual extern string ID
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(11)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Workspace CreateGame([In][MarshalAs(UnmanagedType.BStr)] string p);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(12)]
		public virtual extern void RobloxAuthenticate([In][MarshalAs(UnmanagedType.BStr)] string url, [In][MarshalAs(UnmanagedType.BStr)] string ticket);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(13)]
		public virtual extern void Quit();
	}
}
