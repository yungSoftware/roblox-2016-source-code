using System.Collections;
using System.ComponentModel;
using System.Diagnostics;

namespace Roblox
{
    /// <summary>
    /// Summary description for LogInstaller
    /// </summary>
    [RunInstaller(true)]
    public class LogInstaller : EventLogInstaller
    {
        public const string LogName = "Roblox";
        public const string SourceName = "Web Server";
        public LogInstaller()
        {
            // Set the source name of the event log.
            Source = SourceName;

            // Set the event log that the source writes entrys to.
            Log = LogName;
        }

        public override void Install(IDictionary stateSaver)
        {
            base.Install(stateSaver);

            // Change policy to overwrite as needed
            System.Diagnostics.EventLog log = new EventLog(LogName);
            log.ModifyOverflowPolicy(OverflowAction.OverwriteAsNeeded, 5);
            log.MaximumKilobytes = 16000;
        }
    }
}
