import clr
import sys
clr.AddReference("Emcaster")
clr.AddReference("EmcasterTest")

from Emcaster.Sockets import *
from Emcaster.Topics import *
from System.Threading import *
from EmcasterTest import *

args = sys.argv[1:]

if len(args) != 3:
    print "Usage: EmReceiver 224.0.0.23 4002 my-topic"
    sys.exit(1)

Startup.ConfigureLogging()

address = args[0]
port = int(args[1])
topic = args[2]

class Receiver:
	socket = None
	msg_event = None
	monitor = TopicMonitor(topic, 10);

	def start(self):
		self.monitor.Start()
		self.socket.Start()
	
	def dispose(self):
		if(self.socket):
			self.socket.Dispose()
		self.monitor.Dispose()

receiver = Receiver()

def pgm():
	msgParser = MessageParserFactory()
	reader = PgmReader(msgParser)
	reader.ReceiveBufferInBytes = 1024*1024*5
	receiveSocket = PgmReceiver(address, port, reader)
	receiver.msg_event = msgParser
	receiver.socket = receiveSocket
	
def udp():
	udpReceiver = UdpReceiver(address, port)
	factory = MessageParserFactory()
	parser = MessageParser(factory)
	udpReceiver.ReceiveEvent += parser.OnBytes 
	receiver.msg_event = factory
	receiver.socket = udpReceiver


def go():
	topicSubscriber = TopicSubscriber(topic, receiver.msg_event)
	topicSubscriber.TopicMessageEvent += receiver.monitor.OnMessage
	topicSubscriber.Start()
	receiver.start()

def dispose_all():
	receiver.dispose()
	
sys.exitfunc = dispose_all
	
print args[0], ":", port
