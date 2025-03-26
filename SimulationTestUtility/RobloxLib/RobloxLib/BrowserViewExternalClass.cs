using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	public class BrowserViewExternalClass : IBrowserViewExternal, BrowserViewExternal, _IBrowserViewExternalEvents_Event
	{
		[DispId(1)]
		public virtual extern bool IsRobloxAppIDE
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(1)]
			get;
		}

		[DispId(4)]
		public virtual extern string InstallHost
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(4)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(2)]
		[return: MarshalAs(UnmanagedType.IDispatch)]
		public virtual extern object GetApp();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(3)]
		public virtual extern void StartGame([In][MarshalAs(UnmanagedType.BStr)] string authenticationTicket, [In][MarshalAs(UnmanagedType.BStr)] string authenticationUrl, [In][MarshalAs(UnmanagedType.BStr)] string script);
	}
}
