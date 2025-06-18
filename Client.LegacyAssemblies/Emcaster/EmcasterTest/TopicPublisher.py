import clr
clr.AddReference("Emcaster")
clr.AddReference("EmcasterTest")

from EmcasterTest import *
from Emcaster.Sockets import *
from Emcaster.Topics import *
from System.Threading import *

import sys

Startup.Init();

address = "224.0.0.23"
port = 8001
printStats = 1
topic = "test"
bytes = 10
waitTime = 1000 *10
msgCount = 9999999

class Sender:
	socket = None
	publisher = None
	batch_buffer = 1500
	
	def start(self):
		self.socket.Start()
		asyncWriter = BatchWriter(self.socket, self.batch_buffer)
		asyncWriter.PrintStats = printStats
		asyncWriter.SleepOnMin = 0
		self.publisher = TopicPublisher(asyncWriter);
		self.publisher.Start()
			
	def dispose(self):
		if(self.socket):
			self.socket.Dispose()

sender = Sender() 
sys.exitfunc = sender.dispose

def pgm():
	sendSocket = PgmSource(address, port)
	sendSocket.RateKbitsPerSec = 100000
	sendSocket.WindowSizeInMSecs = 2000
	sendSocket.WindowSizeinBytes = 0
	sender.batch_buffer = 1024 * 128
	sender.socket = sendSocket

def udp():
	udpSocket = UdpSource(address, port)
	sender.batch_buffer = 1500
	sender.socket = udpSocket

def send_all():
	Startup.PublishBatch(sender.publisher, topic, bytes, waitTime, msgCount)

def go():
	sender.start()
	send_all()
		
print "Ready to Publish: ", address, " " , port
print "type udp() or pgm() to select protocol"
print "type go() to start sending"