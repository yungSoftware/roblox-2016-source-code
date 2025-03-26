using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace RobloxLib
{
	public class LuaFunctionClass : ILuaFunction, LuaFunction
	{
		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(1)]
		[return: MarshalAs(UnmanagedType.Struct)]
		public virtual extern object Call([Optional][In][MarshalAs(UnmanagedType.Struct)] object arg1, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg2, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg3, [Optional][In][MarshalAs(UnmanagedType.Struct)] object arg4);

		[MethodImpl(MethodImplOptions.InternalCall, MethodCodeType = MethodCodeType.Runtime)]
		[DispId(2)]
		[return: MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)]
		public virtual extern object[] CallEx([Optional][In][MarshalAs(UnmanagedType.SafeArray, SafeArraySubType = VarEnum.VT_VARIANT)] object[] args);
	}
}
