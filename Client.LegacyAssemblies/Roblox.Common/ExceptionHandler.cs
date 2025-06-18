using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Web;
using Roblox.Common;

namespace Roblox
{
    public interface IExceptionHandlerListener
    {
        // Called when an exception has been logged.
        void exceptionLogged();
    }
    // Throw this exception or an exception derived from this if you don't want it to show up in the Roblox Event Log.
    // This should be used to return an error to the user, but something that technically isn't broken in the system.
    // For example failing validation for a control would be a good candidate as it is nothing for us to fix in the code base.
    public class NotLoggedException : Exception
    {
        public NotLoggedException(string reason) : base(reason) { }
        public NotLoggedException(string reason, Exception inner) : base(reason, inner) { }
        public NotLoggedException() {}
    }

    
    public class ExceptionHandler
    {
        private static Dictionary<Int32, PresentableSQLErrors> PresentableSQLErrorsList;
        private static List<IExceptionHandlerListener> listeners = new List<IExceptionHandlerListener>();

        static ExceptionHandler()
        {
            //Populate the list of SQL Errors that should be present to the Presentation Layer
            if (PresentableSQLErrorsList == null)
            {
                PresentableSQLErrorsList = new Dictionary<int, PresentableSQLErrors>();
                foreach (PresentableSQLErrors err in Converters.EnumToList<PresentableSQLErrors>())
                {
                    PresentableSQLErrorsList.Add((int)err, err);
                }
            }
        }

        public static void addListener(IExceptionHandlerListener listener)
        {
            lock (listeners)
            {
                listeners.Add(listener);
            }
        }
        public static void removeListener(IExceptionHandlerListener listener)
        {
            lock (listeners)
            {
                listeners.Remove(listener);
            }
        }

        public static string GetInnerText(Exception ex)
        {
            if (ex.InnerException != null)
                return GetInnerText(ex.InnerException);
            else
                return ex.ToString();
        }
        public static string GetText(Exception ex)
        {
            string s;
            if (ex.InnerException != null)
                s = ex.ToString() + "\n\nCaused by:\n" + GetText(ex.InnerException);
            else
                s = ex.ToString();

            return s;
        }

        public static void LogException(string errorMessage)
        {
            LogException(new ApplicationException(errorMessage));
        }
        public static void LogException(Exception ex)
        {
            LogException(ex, EventLogEntryType.Error);
        }
        public static void LogException(string errorMessage, EventLogEntryType type)
        {
            LogException(new ApplicationException(errorMessage), type);
        }
        public static void LogException(Exception ex, EventLogEntryType type)
        {
            LogException(ex, type, 1);
        }
        public static void LogException(string errorMessage, string sourceName)
        {
            LogException(new ApplicationException(errorMessage), sourceName);
        }
        public static void LogException(string errorMessage, EventLogEntryType type, string sourceName)
        {
            LogException(new ApplicationException(errorMessage), type, sourceName);
        }
        public static void LogException(Exception ex, string sourceName)
        {
            LogException(ex, EventLogEntryType.Error, 1, sourceName);
        }
        public static void LogException(Exception ex, EventLogEntryType type, string sourceName)
        {
            LogException(ex, type, 1, sourceName);
        }
        public static void LogException(string errorMessage, EventLogEntryType type, int eventID)
        {
            LogException(new ApplicationException(errorMessage), type, eventID);
        }
        public static void LogException(Exception ex, EventLogEntryType type, int eventID)
        {
            LogException(ex, type, eventID, LogInstaller.LogName);
        }
        public static void LogException(string errorMessage, EventLogEntryType type, int eventID, string sourceName)
        {
            LogException(new ApplicationException(errorMessage), type, eventID, sourceName);
        }
        public static void LogException(Exception ex, EventLogEntryType type, int eventID, string sourceName)
        {
            short category = 0;
            string s;
            if (HttpContext.Current == null)
                s = GetText(ex);
            else
            {
                s = ex.Message + "\n\n";
                if (HttpContext.Current.Request != null)
                {
                    s += "Url: " + HttpContext.Current.Request.Url + "\n";
                    if (HttpContext.Current.Request.UrlReferrer != null)
                        s += "Referrer: " + HttpContext.Current.Request.UrlReferrer + "\n";
                    else if (HttpContext.Current.User != null)
                        if (HttpContext.Current.User.Identity != null)
                        {
                            s += "Identity: \"" + HttpContext.Current.User.Identity.Name + "\"\n";
                            category = 2;
                        }
                        else
                        {
                            s += "Identity: null\n";
                            category = 1;
                        }
                    s += "\n";
                }
                s += GetText(ex);
            }

            if (!(ex is NotLoggedException))
            {
                // If the following line fails, run "installutil.exe Roblox.Common.dll"
                EventLog.WriteEntry(sourceName, s, type, eventID, category);
                foreach (IExceptionHandlerListener listener in listeners)
                {
                    listener.exceptionLogged();
                }
            }
        }

        public static void HandleSQLException(System.Data.SqlClient.SqlException eSQL)
        {
            PresentableSQLErrors result;
            if (PresentableSQLErrorsList.TryGetValue(eSQL.Number, out result))
            {
                //Log and throw a presentable exception so that the presentation layer can present it to the user
                PresentableException pe = new PresentableException(result.ToString(), result.ToDescription(), eSQL.Message, eSQL);
                LogException(pe, System.Diagnostics.EventLogEntryType.Warning);
                throw pe;
            }
            //If not a presentable exception, continue to throw it as an unhandled exception
            throw eSQL;
        }

        #region |CustomExceptions|
        //Custom exception class that should be presented to the Presentation Layer and not left unhandled
        public class PresentableException : ApplicationException
        {
            private string _presentationErrorCode;
            public string PresentationErrorCode
            {
                get { return _presentationErrorCode; }
            }

            private string _presentationErrorMessage;
            public string PresentationErrorMessage
            {
                get { return _presentationErrorMessage; }
            }

            public PresentableException(string presentationErrorMessage, string errorMessage)
                : this(string.Empty, presentationErrorMessage, errorMessage) { }
            
            public PresentableException(string presentationErrorCode, string presentationErrorMessage, string errorMessage)
                : this(presentationErrorCode, presentationErrorMessage, errorMessage, null) { }

            public PresentableException(string presentationErrorMessage, string errorMessage, Exception innerException)
                : this(string.Empty, presentationErrorMessage, errorMessage, innerException) { }

            public PresentableException(string presentationErrorCode, string presentationErrorMessage, string errorMessage, Exception innerException)
                : base(errorMessage, innerException)
            {
                _presentationErrorMessage = presentationErrorMessage;
                _presentationErrorCode = presentationErrorCode;
            }
        }
        #endregion

        #region |ExceptionEnums|
        //SQL Errors that should be presented to the Presentation Layer - value of the enum must be the Error Number returned by the SQL Server
        public enum PresentableSQLErrors
        {
            [Description("Search Query is malformed, please check the search terms and try your search again.")]
            SearchQueryMalformed = 7630
        #endregion
        }
    }
}
