# Combines a hierarchy of files into a single output stream.
#
# Copyright (C) Jaypha 2014.
#
# Distributed under the Boost Software License, Version 1.0.
# (See http://www.boost.org/LICENSE_1_0.txt)
#
# Authors: Jason den Dulk

VERSION=1.0.0
PACKAGE_NAME=hcat
TARBALL_NAME=$(PACKAGE_NAME)-$(VERSION)


DC=dmd

all: bin

bin: src/hcat.d
	$(DC) -O -inline -release src/hcat.d
	strip hcat

install: hcat
	cp hcat $(DESTDIR)/usr/bin

uninstall:
	rm -f $(DESTDIR)/usr/bin/hcat

distclean: clean

clean:
	rm hcat
	rm hcat.o
	rm -rf .dub
	rm -rf $(TARBALL_NAME)

tarball:
	mkdir $(TARBALL_NAME)
	cp Makefile $(TARBALL_NAME)
	cp -R src $(TARBALL_NAME)
	tar -cvzf $(TARBALL_NAME).tar.gz $(TARBALL_NAME)  

