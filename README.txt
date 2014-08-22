Filecombine
-----------

Motivation
----------

Many config files or source files are too big to be in just one file. Splitting them up
makes them more readable and modular. However the language specifications do not
necessarily account for this. What to do?

Idea
----

A simple combiner utitily that preprocesses input files by reading them, and whenever it
encounters a '#include', it includes the indicated file at that point and recursively scans
that file. The result is a single stream of content that can be passed to the regular
processor.

Example
-------

file1.txt contains

hello
  #include file2.txt
world


file2.txt contains:

to all
in the

output would be:

hello
  to all
  in the
world

Notice that indentation is inherited.

----------------------------
Copyright (C) Jaypha 2014.
