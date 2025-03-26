using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("DB4E00C1-D221-41B1-88CE-F9BB32A68C02")]
	[TypeLibType(4288)]
	public interface IBrowserViewExternal
	{
		[DispId(1)]
		bool IsRobloxAppIDE
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(1)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(2)]
		[return: MarshalAs(UnmanagedType.IDispatch)]
		object GetApp();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(3)]
		void StartGame([In][MarshalAs(UnmanagedType.BStr)] string authenticationTicket, [In][MarshalAs(UnmanagedType.BStr)] string authenticationUrl, [In][MarshalAs(UnmanagedType.BStr)] string script);

		[DispId(4)]
		string InstallHost
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(4)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}
	}
}
