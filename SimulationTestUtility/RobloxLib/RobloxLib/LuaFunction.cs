using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[CoClass(typeof(LuaFunctionClass))]
	[Guid("22423A31-9290-4F17-BD95-000F61859FAE")]
	public interface LuaFunction : ILuaFunction
	{
	}
}
