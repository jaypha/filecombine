// Written in the D programming language.

/*
 * Combines a hierarchy of files into a single output stream.
 *
 * Copyright (C) Jaypha 2014-15.
 *
 * Distributed under the Boost Software License, Version 1.0.
 * (See http://www.boost.org/LICENSE_1_0.txt)
 *
 * Authors: Jason den Dulk
 */

module hcat;

import std.stdio;
import std.algorithm;
import std.string;
import std.path;
import std.file;

string includeStr;

void readFile(string fname, string indent)
{
  auto cwd = getcwd();
  chdir(dirName(fname));
  auto fin = File(baseName(fname),"r");

  foreach (string line; lines(fin))
  {
    auto r = findSplit(line,includeStr);
    if (!r[1].length == 0)
      readFile(strip(r[2]),indent ~ r[0]);
    else
      stdout.write(indent,line);
  }
  chdir(cwd);
}

void main(string[] args)
{
  if (args.length < 2)
  {
    writeln("synopsis: hcat <file> [<include-tag>]");
  }
  else
  {
    if (args.length < 3)
        includeStr = "#include";
    else
        includeStr = args[2];

    //chdir(dirName(args[1]));
    readFile(args[1],"");
  }
}
