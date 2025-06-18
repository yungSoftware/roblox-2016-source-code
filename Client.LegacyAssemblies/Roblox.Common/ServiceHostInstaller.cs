using System;
using System.Configuration.Install;
using System.ServiceProcess;

namespace Roblox.ServiceProcess
{
	public abstract class ServiceHostInstaller : Installer
	{
		public abstract string ServiceName { get; }
		public abstract string DisplayName { get; }
		public abstract string Description { get; }
		

		public ServiceHostInstaller()
        {
			var processInstaller = new ServiceProcessInstaller();
			processInstaller.Account = ServiceAccount.LocalSystem;

			var serviceInstaller = new ServiceInstaller();
			serviceInstaller.ServiceName = ServiceName;
			serviceInstaller.DisplayName = DisplayName;
			serviceInstaller.Description = Description;
			serviceInstaller.StartType = ServiceStartMode.Automatic;
			serviceInstaller.Committed += service_Committed;

			Installers.Add(processInstaller);
			Installers.Add(serviceInstaller);
        }

		private void service_Committed(object sender, InstallEventArgs e)
		{
			using (var controller = new ServiceController(ServiceName))
			{
				controller.Start();
				controller.WaitForStatus(ServiceControllerStatus.Running, TimeSpan.FromSeconds(10));
			}
		}
	}
}
