using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("6343895F-4799-43C8-94F9-3D51A0D293CF")]
	[TypeLibType(4288)]
	public interface IApp
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		[return: MarshalAs(UnmanagedType.Interface)]
		Workspace CreateGame([In][MarshalAs(UnmanagedType.BStr)] string p);

		[DispId(4)]
		string Version
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(4)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[DispId(11)]
		string ID
		{
			[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
			[DispId(11)]
			[return: MarshalAs(UnmanagedType.BStr)]
			get;
		}

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(12)]
		void RobloxAuthenticate([In][MarshalAs(UnmanagedType.BStr)] string url, [In][MarshalAs(UnmanagedType.BStr)] string ticket);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(13)]
		void Quit();
	}
}
