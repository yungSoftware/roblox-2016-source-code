using System.Runtime.InteropServices;

namespace RobloxLib
{
	[TypeLibType(TypeLibTypeFlags.FHidden)]
	[ClassInterface(ClassInterfaceType.None)]
	public sealed class _IBrowserViewExternalEvents_SinkHelper : _IBrowserViewExternalEvents
	{
		public int m_dwCookie;

		internal _IBrowserViewExternalEvents_SinkHelper()
		{
			//Error decoding local variables: Signature type sequence must have at least one element.
			m_dwCookie = 0;
		}
	}
}
