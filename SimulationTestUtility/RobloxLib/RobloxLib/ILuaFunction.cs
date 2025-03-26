using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[TypeLibType(4288)]
	[Guid("22423A31-9290-4F17-BD95-000F61859FAE")]
	public interface ILuaFunction
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		[return: MarshalAs(UnmanagedType.Struct)]
		object Call([Optional][In][MarshalAs(UnmanagedType.Struct)] object arg1, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg2, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg3, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg4);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(2)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		object[] CallEx([Optional][In][MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)] object[] args);
	}
}
