// Written in the D programming language.

/*
 * Combines a hierarchy of files into a single output stream.
 *
 * Copyright (C) Jaypha 2014.
 *
 * Distributed under the Boost Software License, Version 1.0.
 * (See http://www.boost.org/LICENSE_1_0.txt)
 *
 * Authors: Jason den Dulk
 */

module filecombine;

import std.stdio;
import std.algorithm;
import std.string;

string include_str;

void read_file(string fname, string indent)
{
  auto fin = File(fname,"r");

  foreach (string line; lines(fin))
  {
    auto r = findSplit(line,include_str);
    if (!r[1].length == 0)
      read_file(strip(r[2]),indent ~ r[0]);
    else
      write(indent,line);
  }  
}

void main(string[] args)
{
  if (args.length < 2)
  {
    writeln("synopsis: filecombine <file> [<include_tag>]");
  }
  else
  {
    if (args.length < 3)
        include_str = "#include";
    else
        include_str = args[2];
      
    read_file(args[1],"");
  }
}
