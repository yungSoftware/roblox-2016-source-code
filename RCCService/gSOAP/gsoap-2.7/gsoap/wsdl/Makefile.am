####### This is the input file for automake, which will generate Makefile.in ##########


## not a GNU package. You can remove this line, if
## you have all needed files, that a GNU package needs
AUTOMAKE_OPTIONS = foreign 1.4

INCLUDES=-I$(top_srcdir)/gsoap
LDFLAGS=$(INCLUDES) -L$(srcdir)
SOAP=$(top_builddir)/gsoap/src/soapcpp2
SOAP_CPP_LIB_SSL=$(top_builddir)/gsoap/libgsoapssl++.a
SOAP_CPP_SRC=wsdlC.cpp
SOAPHEADER=$(srcdir)/wsdl.h
SOAP_FLAGS=-SC -pwsdl -I../import
BUILT_SOURCES=$(SOAP_CPP_SRC)

$(SOAP_CPP_SRC) : $(SOAPHEADER)
	$(SOAP) $(SOAP_FLAGS) $(SOAPHEADER)

#LIBS=

bin_PROGRAMS=wsdl2h

wsdl2h_CFLAGS=$(C_DEBUG_FLAGS) $(SOAPCPP2_NONAMESPACES) -D$(platform)
wsdl2h_CPPFLAGS=$(C_DEBUG_FLAGS) $(SOAPCPP2_NONAMESPACES) -D$(platform)
wsdl2h_CXXFLAGS=-DWITH_OPENSSL -DWITH_GZIP $(WSDL2H_IMPORTPATH)
wsdl2h_SOURCES=wsdl2h.cpp wsdl.cpp schema.cpp types.cpp service.cpp soap.cpp mime.cpp
wsdl2h_LDADD=$(SOAP_CPP_SRC) $(SOAP_CPP_LIB_SSL) $(SAMPLE_EXTRA_LIBS) -lssl -lcrypto -lz

CLEANFILES= *~ *C.cpp *H.h *Stub.h *.nsmap
