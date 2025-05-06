using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	public class WorkspaceClass : IWorkspace, Workspace
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		public virtual extern void Insert([In][MarshalAs(UnmanagedType.BStr)] string url);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(2)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Content Write();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(3)]
		[return: MarshalAs(UnmanagedType.Interface)]
		public virtual extern Content WriteSelection();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(4)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		public virtual extern object[] ExecUrlScript([In][MarshalAs(UnmanagedType.BStr)] string url, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg1, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg2, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg3, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg4);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(5)]
		public virtual extern void Close();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(6)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		public virtual extern object[] ExecScript([In][MarshalAs(UnmanagedType.BStr)] string script, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg1, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg2, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg3, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg4);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(7)]
		public virtual extern void StartDrag([In][MarshalAs(UnmanagedType.BStr)] string url);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[TypeLibFunc(64)]
		[DispId(8)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		public virtual extern object[] GetPlayers();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(9)]
		[TypeLibFunc(64)]
		public virtual extern void ReportAbuse([In] int abuserId, [In][MarshalAs(UnmanagedType.BStr)] string comment);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(10)]
		[TypeLibFunc(64)]
		public virtual extern void Save();

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(11)]
		[TypeLibFunc(64)]
		public virtual extern void SaveUrl([In][MarshalAs(UnmanagedType.BStr)] string url);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[TypeLibFunc(64)]
		[DispId(12)]
		public virtual extern void JoinGame([In][MarshalAs(UnmanagedType.BStr)] string server, [In][MarshalAs(UnmanagedType.BStr)] string port, [In][MarshalAs(UnmanagedType.BStr)] string gameTicket);
	}
}
