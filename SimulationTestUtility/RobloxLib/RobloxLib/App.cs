using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("6343895F-4799-43C8-94F9-3D51A0D293CF")]
	[CoClass(typeof(AppClass))]
	public interface App : IApp
	{
	}
}
