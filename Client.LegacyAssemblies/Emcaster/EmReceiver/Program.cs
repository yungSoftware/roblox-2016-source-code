using System;
using System.Collections.Specialized;
using System.Threading;
using Common.Logging;
using Common.Logging.Simple;
using Emcaster.Sockets;
using Emcaster.Topics;

namespace Emcaster.EmReceiver
{
    internal class Program
    {
        [STAThread]
        private static void Main(string[] args)
        {
            if (args.Length != 3)
            {
                Console.WriteLine("Usage: EmReceiver 223.0.0.23 4002 my-topic");
                return;
            }

            NameValueCollection vals = new NameValueCollection();
            vals["level"] = "info";
            ConsoleOutLoggerFactoryAdapter logger = new ConsoleOutLoggerFactoryAdapter(vals);
            LogManager.Adapter = logger;

            MessageParserFactory msgParser = new MessageParserFactory();
            PgmReader reader = new PgmReader(msgParser);
            int port = int.Parse(args[1]);
            PgmReceiver receiveSocket = new PgmReceiver(args[0], port, reader);

            TopicSubscriber topicSubscriber = new TopicSubscriber(args[2], msgParser);
            TopicMonitor monitor = new TopicMonitor(args[2], 10);
            topicSubscriber.TopicMessageEvent += monitor.OnMessage;
            topicSubscriber.Start();
            monitor.Start();
            receiveSocket.Start();
            while (true)
            {
                Thread.Sleep(20000);
            }
        }
    }
}