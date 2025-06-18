using System;
using System.Configuration.Install;
using System.ServiceProcess;

namespace Roblox
{
    public class BasicService : ServiceBase
    {
        public void Process(string[] args, Action statsTask)
        {
            if (args.Length > 0)
            {
                try
                {
                    string option = args[0].Substring(1).ToLower();
                    if (option == "console")
                    {
                        ConsoleKey exitKey = ConsoleKey.Escape;
                        ConsoleKey garbageCollectionKey = ConsoleKey.G;

                        Console.WriteLine("Starting {0}...", GetType());
                        OnStart(args);

                        Console.WriteLine("Service started. Press any key to {0}.", statsTask == null ? "exit" : "get stats");
                        Console.WriteLine("Press {0} to force a full Garbage Collection cycle", garbageCollectionKey);
                        Console.WriteLine("Press {0} to exit process", exitKey);
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
                System.ServiceProcess.ServiceBase.Run(this);
            }
        }
    }
}
