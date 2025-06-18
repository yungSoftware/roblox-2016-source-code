using System;
using System.Configuration.Install;

using System.ServiceProcess;

namespace Roblox.ServiceProcess
{
    public interface IArgumentService
    {
        void ProcessArgs(string[] args);
    }
    public class ServiceBasePublic : System.ServiceProcess.ServiceBase
    {
        public void OnStartPublic(string[] args)
        {
            OnStart(args);
        }

        public void OnStopPublic()
        {
            OnStop();
        }
    }
    /// <summary>
    /// An NT Service that hosts a WCF Service.
    /// This class encapsulates a ServiceHost.
    /// </summary>
    public class ServiceHostApp<TServiceClass> : ServiceBasePublic where TServiceClass : class
    {
        // Events forwarded from the encapsulated ServiceHost
        public event EventHandler HostClosed;
        public event EventHandler HostClosing;
        public event EventHandler HostFaulted;
        public event EventHandler HostOpened;
        public event EventHandler HostOpening;

        System.ServiceModel.ServiceHost serviceHost = null;
        TServiceClass singleton;

        ServiceBasePublic[] otherSingletons = null;

        public ServiceHostApp(TServiceClass singleton)
        {
            this.singleton = singleton;
        }
        public ServiceHostApp(TServiceClass singleton, ServiceBasePublic[] others) 
            : this(singleton)
        {
            otherSingletons = others;
        }

        public ServiceHostApp()
        {
        }

        protected override void OnStart(String[] args)
        {
            CloseServiceHost();

            if (singleton != null)
                serviceHost = new System.ServiceModel.ServiceHost(singleton);
            else
                serviceHost = new System.ServiceModel.ServiceHost(typeof(TServiceClass));

            if (serviceHost.SingletonInstance is IArgumentService)
            {
                (serviceHost.SingletonInstance as IArgumentService).ProcessArgs(args);
            }

            serviceHost.Closed += new EventHandler(serviceHost_Closed);
            serviceHost.Closing += new EventHandler(serviceHost_Closing);
            serviceHost.Faulted += new EventHandler(serviceHost_Faulted);
            serviceHost.Opened += new EventHandler(serviceHost_Opened);
            serviceHost.Opening += new EventHandler(serviceHost_Opening);

            serviceHost.Open();

            if(otherSingletons != null){
                foreach(ServiceBasePublic sbp in otherSingletons){
                    sbp.OnStartPublic(args);
                }
            }
        }

        private void CloseServiceHost()
        {
            if (serviceHost != null)
            {
                if (serviceHost.State != System.ServiceModel.CommunicationState.Closed)
                    serviceHost.Close();
                serviceHost.Closed -= new EventHandler(serviceHost_Closed);
                serviceHost.Closing -= new EventHandler(serviceHost_Closing);
                serviceHost.Faulted -= new EventHandler(serviceHost_Faulted);
                serviceHost.Opened -= new EventHandler(serviceHost_Opened);
                serviceHost.Opening -= new EventHandler(serviceHost_Opening);
                serviceHost = null;
            }
        }

        void serviceHost_Closed(object sender, EventArgs e)
        {
            if (HostClosed != null)
                HostClosed(sender, e);
        }
        void serviceHost_Closing(object sender, EventArgs e)
        {
            if (HostClosing != null)
                HostClosing(sender, e);
        }
        void serviceHost_Faulted(object sender, EventArgs e)
        {
            if (HostFaulted != null)
                HostFaulted(sender, e);
        }
        void serviceHost_Opened(object sender, EventArgs e)
        {
            if (HostOpened != null)
                HostOpened(sender, e);
        }
        void serviceHost_Opening(object sender, EventArgs e)
        {
            if (HostOpening != null)
                HostOpening(sender, e);
        }

        protected override void OnStop()
        {
            CloseServiceHost();

            if (otherSingletons != null)
            {
                foreach (ServiceBasePublic sbp in otherSingletons)
                {
                    sbp.OnStopPublic();
                }
            }

        }

        public void Process(string[] args)
        {
            Process(args, null);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="args"></param>
        /// <param name="statsTask">A task to perform when the user presses a key</param>
        public void Process(string[] args, Action statsTask)
        {
            if (args.Length > 0)
            {
                try
                {
                    string option = args[0].Substring(1).ToLower();
                    if (option == "console")
                    {
                        ConsoleKey closeSocketsKey = ConsoleKey.Q;
                        ConsoleKey exitKey = ConsoleKey.Escape;
                        ConsoleKey garbageCollectionKey = ConsoleKey.G;

                        Console.WriteLine("Starting {0}...", typeof(TServiceClass));
                        OnStart(args);

                        Console.WriteLine("Service started. Press any key to {0}.", statsTask == null ? "exit" : "get stats");
                        Console.WriteLine("Press {0} to force a full Garbage Collection cycle", garbageCollectionKey);
                        Console.WriteLine("Press {0} to close sockets or {1} to exit process", closeSocketsKey, exitKey);
                        while (true)
                        {
                            ConsoleKey key = Console.ReadKey(true).Key;
                            if (key == exitKey)
                                break;
                            else if (key == garbageCollectionKey)
                            {
                                Console.Write("Initiating GC cycle ....");
                                GC.Collect(3, GCCollectionMode.Forced);
                                Console.WriteLine("done");
                            }
                            else if (key == closeSocketsKey)
                            {
                                //Close Sockets but keep the process alive
                                Console.Write("Closing sockets....");
                                this.CloseServiceHost();
                                Console.WriteLine(" done");
                                Console.WriteLine("Press {0} to exit process", exitKey);
                            }
                            else
                            {
                                if (statsTask != null)
                                    statsTask();
                                else
                                    break;
                            }
                        }
                        Console.WriteLine("Stopping Service.");
                        OnStop();
                    }
                    else if (option == "install")
                    {
                        // NOTE: This only works if the assembly has an appropriate Installer object in it
                        Console.WriteLine("Installing...");
                        AssemblyInstaller installer = new AssemblyInstaller(System.Reflection.Assembly.GetEntryAssembly(), new string[] { });
                        installer.UseNewContext = true;
                        System.Collections.IDictionary savedState = new System.Collections.Hashtable();
                        installer.Install(savedState);
                        installer.Commit(savedState);
                        Console.WriteLine("Service Installed");
                    }
                    else if (option == "uninstall")
                    {

                        Console.WriteLine("Uninstalling...");
                        AssemblyInstaller installer = new AssemblyInstaller(System.Reflection.Assembly.GetEntryAssembly(), new string[] { });
                        installer.UseNewContext = true;
                        System.Collections.IDictionary savedState = new System.Collections.Hashtable();
                        installer.Uninstall(savedState);
                        Console.WriteLine("Service Uninstalled");
                    }
                    else
                        throw new ApplicationException("Bad argument " + args[0]);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }
            }
            else
            {
                if (otherSingletons != null)
                {
                    ServiceBase[] hosts = new ServiceBase[otherSingletons.Length + 1];
                    int pos = 0;
                    hosts[pos++] = this;
                    foreach (ServiceBase sb in otherSingletons)
                        hosts[pos++] = sb;
                    System.ServiceProcess.ServiceBase.Run(hosts);
                }
                else
                {
                    System.ServiceProcess.ServiceBase.Run(this);
                }
            }
        }
    }
}