####### This is the input file for automake, which will generate Makefile.in ##########

SUBDIRS=mod_gsoap example
CLEANFILES= *~

## not a GNU package. You can remove this line, if
## you have all needed files, that a GNU package needs
AUTOMAKE_OPTIONS = foreign 1.4
SRCDIRNAME=apache_gsoap.$(VERSION)
BACKUPFILENAME=$(SRCDIRNAME).tgz

.PHONY: backup 

backup:
	$(MAKE) clean
	if [ -f ../$(BACKUPFILENAME) ] ; then \
		rm ../$(BACKUPFILENAME); \
	fi
	(pushd .. && tar -czf $(BACKUPFILENAME) $(SRCDIRNAME) && popd)
	ls -l ../$(BACKUPFILENAME)
