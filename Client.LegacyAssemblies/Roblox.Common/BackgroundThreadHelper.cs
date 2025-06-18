using System;
using System.Threading;
using System.Diagnostics;
using System.Collections.Generic;

namespace Roblox
{
    public class BackgroundThreadHelper
    {
        public delegate void F();

        public class Handle : IDisposable
        {
            private EventWaitHandle eventWaitHandle;

            internal Handle(EventWaitHandle eventWaitHandle)
            {
                this.eventWaitHandle = eventWaitHandle;
                lock (waitHandles) waitHandles.Add(eventWaitHandle);
            }

            public void Set() { eventWaitHandle.Set(); }
            public void Dispose()
            {
                lock (waitHandles)
                    waitHandles.Remove(eventWaitHandle);
            }
        }

        private static bool done = false;
        private static readonly EventWaitHandle doneHandle = new EventWaitHandle(false, EventResetMode.ManualReset);
        private static readonly List<EventWaitHandle> waitHandles = new List<EventWaitHandle>();

        static BackgroundThreadHelper()
        {
            EventLog.WriteEntry(LogInstaller.SourceName, "BackgroundThreadHelper Startup", EventLogEntryType.Information, 8732);
            AppDomain.CurrentDomain.DomainUnload += CurrentDomain_DomainUnload;
        }

        public static bool IsDone { get { return done; } }

        private static void CurrentDomain_DomainUnload(object sender, EventArgs e)
        {
            EventLog.WriteEntry(LogInstaller.SourceName, "BackgroundThreadHelper DomainUnload", EventLogEntryType.Information, 8732);
            EventWaitHandle[] newWaitHandles;
            lock (waitHandles)
            {
                newWaitHandles = new EventWaitHandle[waitHandles.Count];
                waitHandles.CopyTo(newWaitHandles);
            }

            EventLog.WriteEntry(LogInstaller.SourceName, "BackgroundThreadHelper Setting doneHandle", EventLogEntryType.Information, 8732);
            done = true;
            doneHandle.Set();
            EventLog.WriteEntry(LogInstaller.SourceName, "BackgroundThreadHelper doneHandle Set", EventLogEntryType.Information, 8732);
            for (int i = 0; i < newWaitHandles.Length; i++) newWaitHandles[i].Set();

            EventLog.WriteEntry(LogInstaller.SourceName, "BackgroundThreadHelper waitHandles Set", EventLogEntryType.Information, 8732);
        }
        public static bool Wait(TimeSpan span) { return doneHandle.WaitOne(span, false); }
        public static bool Wait(TimeSpan span, bool exitContext) { return doneHandle.WaitOne(span, exitContext); }
        public static Thread RunInBackground(TimeSpan sleepTime, F f)
        {
            var thread = new Thread(() =>
            {
                while (true)
                {
                    try
                    {
                        Thread.Sleep(sleepTime);
                        f();
                        continue;
                    }
                    catch (ThreadInterruptedException) { }
                    catch (ThreadAbortException) { }
                    catch (Exception ex) { ExceptionHandler.LogException(ex); continue; }
                    break;
                }
            })
            { IsBackground = true };
            thread.Start();
            return thread;
        }
        public static Handle SetOnProcessExit(EventWaitHandle eventWaitHandle) { return new Handle(eventWaitHandle); }
    }
}
