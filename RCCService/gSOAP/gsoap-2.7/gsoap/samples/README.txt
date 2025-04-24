
GSOAP APPLICATION EXAMPLES

To build the example services and clients, run 'make' in the 'samples'
directory. The concurrent server examples require the Pthreads library. The SSL
example requires OpenSSL. The webserver example also requires Zlib.

calc:                     Simple calculator client and server (C)
calc++:                   Simple calculator client and server (C++)
calc_vs2005:              VS2005 project calc client example (C++)
calc_xcode:               Mac OS X Xcode project calc client example (C++)
dime:                     DIME attachment client and server (C++,pthreads)
dom:                      DOM-based calculator client (C++)
events:                   One-way SOAP messaging event handling (C,pthreads)
events++:                 One-way SOAP messaging event handling (C++,pthreads)
factory:                  Remote object factory and simple ORB (C++)
factorytest:              Test client for remote object factory (C++)
gmt:                      One-liner service to tell the time in GMT (C++)
googleapi:                Google Web API client (deprecated by Google) (C)
hello:                    One-liner greeting service (C++)
httpcookies:              HTTP cookie client and server (C++)
link:                     Linking multiple clients/services (C)
link++:                   Linking multiple clients/services (C++)
lu:                       Linear solver client and server (C++)
magic:                    Magic squares client and server (C++,pthreads)
mashup:                   Combining two services into a new service (C)
mashup++:                 Combining two services into a new service (C++)
mtom:                     MTOM attachment client and server (C)
mtom-stream:              MTOM streaming attachment client and server (C)
polytest:                 Polymorphic object exchange (C++)
roll:                     One-liner roll of a dice service (C++)
router:                   Router of HTTP messages over TCP/IP (C,pthreads)
rss:                      RSS 0.91, 0.92, and 2.0 server (C)
ssl:                      HTTPS/SSL example (C,pthreads,OpenSSL)
udp:                      SOAP-over-UDP example client and server (C)
varparam:                 Variable polymorphic parameters (C++)
webserver:                Stand-alone Web server (C,pthreads,OpenSSL,Zlib)
wsa:                      WS-Addressing demo (C)
wsse:                     WS-Security demo (C,OpenSSL)
xml-rpc:                  XML-RPC support and examples (C/C++)

LIBRARY AND GSOAP PLUGIN SUPPORT

Some of the examples require the following support libraries and plugins:

plugin/threads.h/.c       MS Windows threads and Posix threads wrapper
plugin/cacerts.h/.c       Hard-coded SSL public certificates
plugin/wsaapi.h/.c        WS-Addressing plugin
plugin/wsseapi.h/.c       WS-Security plugin

DISCLAIMER

WE DO OUR BEST TO PROVIDE YOU WITH REAL-WORLD EXAMPLES BUT WE CANNOT GUARANTEE
THAT ALL CLIENT EXAMPLES CAN CONNECT TO THIRD PARTY WEB SERVICES WHEN THESE
SERVICES ARE DOWN OR HAVE BEEN REMOVED.

MAC OS X XCODE PROJECTS

A Mac OS X Xcode project example is included in samples/calc_xcode.

MS VS2005 PROJECTS

A Visual Studio 2005 project example is included in samples/calc_vs2005. A
custom build step is defined for the gSOAP header file calc.h. The custom build
step invokes soapcpp2 to generate the source code for the project. Note that
the step to obtain the gSOAP header file calc.h is intentionally omitted, e.g.
wsdl2h is not part of this process. It is advised to run wsdl2h manually and
try various wsdl2h options and typemap.dat definitions to customize the wsdl2h
output.

SSL WITH OPENSSL

To try the SSL-secure SOAP server, install OpenSSL and change the occurrences
of "linprog2.cs.fsu.edu" in sslclient.c and sslserver.c to the machine name
(or machine IP) you are using. Example .pem files are included but you need to
create your own .pem files (see OpenSSL documentation).

The sslclient and sslserver codes can then be build as follows:

soapcpp2 -c ssl.h
gcc -DWITH_OPENSSL -o sslclient sslclient.c stdsoap2.c soapC.c soapClient.c -lssl -lcrypto
gcc -DWITH_OPENSSL -o sslserver sslserver.c stdsoap2.c soapC.c soapServer.c -lssl -lcrypto -lpthread

COPYRIGHT AND LICENSE

The gSOAP examples in the 'samples' directory are distributed under the GPL.
See the GPL license notice below.

A commercial license is available from Genivia, Inc. Please contact:
contact@genivia.com

gSOAP XML Web services tools
Copyright (C) 2001-2008, Robert van Engelen, Genivia, Inc. All Rights Reserved.

--------------------------------------------------------------------------------
This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 59 Temple
Place, Suite 330, Boston, MA 02111-1307 USA

Author contact information:
engelen@genivia.com / engelen@acm.org
--------------------------------------------------------------------------------

