using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("794D78C9-B0EC-4BC9-B881-B5F45E1D530B")]
	[TypeLibType(4288)]
	public interface IWorkspace
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		void Insert([In][MarshalAs(UnmanagedType.BStr)] string url);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(2)]
		[return: MarshalAs(UnmanagedType.Interface)]
		Content Write();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(3)]
		[return: MarshalAs(UnmanagedType.Interface)]
		Content WriteSelection();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(4)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		object[] ExecUrlScript([In][MarshalAs(UnmanagedType.BStr)] string url, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg1, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg2, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg3, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg4);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(5)]
		void Close();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(6)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		object[] ExecScript([In][MarshalAs(UnmanagedType.BStr)] string script, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg1, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg2, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg3, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg4);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(7)]
		void StartDrag([In][MarshalAs(UnmanagedType.BStr)] string url);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(8)]
		[TypeLibFunc(64)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		object[] GetPlayers();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(9)]
		[TypeLibFunc(64)]
		void ReportAbuse([In] int abuserId, [In][MarshalAs(UnmanagedType.BStr)] string comment);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(10)]
		[TypeLibFunc(64)]
		void Save();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(11)]
		[TypeLibFunc(64)]
		void SaveUrl([In][MarshalAs(UnmanagedType.BStr)] string url);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[TypeLibFunc(64)]
		[DispId(12)]
		void JoinGame([In][MarshalAs(UnmanagedType.BStr)] string server, [In][MarshalAs(UnmanagedType.BStr)] string port, [In][MarshalAs(UnmanagedType.BStr)] string gameTicket);
	}
}
