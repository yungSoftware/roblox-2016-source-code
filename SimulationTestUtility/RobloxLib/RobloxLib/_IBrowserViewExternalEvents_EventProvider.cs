using System;
using System.Collections;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Threading;

namespace RobloxLib
{
	internal sealed class _IBrowserViewExternalEvents_EventProvider : _IBrowserViewExternalEvents_Event, IDisposable
	{
		private IConnectionPointContainer m_ConnectionPointContainer;

		private ArrayList m_aEventSinkHelpers;

		private IConnectionPoint m_ConnectionPoint;

		private void Init()
		{
			IConnectionPoint ppCP = null;
			Guid riid = new Guid(new byte[16]
			{
				173, 36, 249, 156, 229, 29, 107, 68, 130, 163,
				177, 16, 41, 157, 83, 161
			});
			m_ConnectionPointContainer.FindConnectionPoint(ref riid, out ppCP);
			m_ConnectionPoint = ppCP;
			m_aEventSinkHelpers = new ArrayList();
		}

		public _IBrowserViewExternalEvents_EventProvider(object P_0)
		{
			//Error decoding local variables: Signature type sequence must have at least one element.
			m_ConnectionPointContainer = (IConnectionPointContainer)P_0;
		}

		public void Finalize()
		{
			Monitor.Enter(this);
			try
			{
				if (m_ConnectionPoint == null)
				{
					return;
				}
				int count = m_aEventSinkHelpers.Count;
				int num = 0;
				if (0 < count)
				{
					do
					{
						_IBrowserViewExternalEvents_SinkHelper iBrowserViewExternalEvents_SinkHelper = (_IBrowserViewExternalEvents_SinkHelper)m_aEventSinkHelpers[num];
						m_ConnectionPoint.Unadvise(iBrowserViewExternalEvents_SinkHelper.m_dwCookie);
						num++;
					}
					while (num < count);
				}
				Marshal.ReleaseComObject(m_ConnectionPoint);
			}
			catch (Exception)
			{
			}
			finally
			{
				Monitor.Exit(this);
			}
		}

		public void Dispose()
		{
			//Error decoding local variables: Signature type sequence must have at least one element.
			Finalize();
			GC.SuppressFinalize(this);
		}
	}
}
