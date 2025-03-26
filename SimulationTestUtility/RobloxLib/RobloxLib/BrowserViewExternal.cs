using System.Runtime.InteropServices;

namespace RobloxLib
{
	[ComImport]
	[Guid("DB4E00C1-D221-41B1-88CE-F9BB32A68C02")]
	[CoClass(typeof(BrowserViewExternalClass))]
	public interface BrowserViewExternal : IBrowserViewExternal, _IBrowserViewExternalEvents_Event
	{
	}
}
