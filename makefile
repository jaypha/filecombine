# Combines a hierarchy of files into a single output stream.
#
# Copyright (C) Jaypha 2014.
#
# Distributed under the Boost Software License, Version 1.0.
# (See http://www.boost.org/LICENSE_1_0.txt)
#
# Authors: Jason den Dulk

filecombine: filecombine.d
	dmd -O -inline -release filecombine.d

install: filecombine
	cp filecombine /usr/local/bin
	strip /usr/local/bin/filecombine

clean:
	rm filecombine
	rm filecombine.o

