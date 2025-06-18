using System;
using System.Collections.Specialized;
using System.Text;
using System.Threading;
using Common.Logging;
using Common.Logging.Simple;
using Emcaster.Topics;

namespace EmcasterTest
{
    public class Startup
    {
        public static void Init()
        {
            ConfigureLogging();
        }

        public static byte[] ToBytes(string data)
        {
            return new UTF8Encoding().GetBytes(data);
        }

        public static void PublishBatch(TopicPublisher pubber, string topic, int bytelength, int waitTime, int batchSize)
        {
            byte[] bytes = new byte[bytelength];

            pubber.Publish(topic, bytes, 0, bytelength, waitTime);

            // Give time for subscribers to initialize
            Thread.Sleep(2000);

            for (int i = 1; i < batchSize; i++)
            {
                pubber.Publish(topic, bytes, 0, bytelength, waitTime);
            }
        }

        public static void ConfigureLogging()
        {
            NameValueCollection vals = new NameValueCollection();
            vals["level"] = "info";
            ConsoleOutLoggerFactoryAdapter logger = new ConsoleOutLoggerFactoryAdapter(vals);
            LogManager.Adapter = logger;
            ILog log = LogManager.GetLogger(typeof (Startup));
            AppDomain.CurrentDomain.UnhandledException +=
                delegate(object sender, UnhandledExceptionEventArgs exc) { log.Error(exc.ExceptionObject); };
        }
    }
}