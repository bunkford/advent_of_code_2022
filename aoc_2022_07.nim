import os, strutils, sequtils, tables, math

var data = (getAppDir() / "aoc_2022_07.txt").lines.toSeq


proc get_folders(data:seq[string]): Table[string, int] =

  var folders = initTable[string, int]()
  var current_dir: seq[string]
  for row in data:
    if row == "$ cd ..": # navigate up
      discard current_dir.pop()
    elif row[0..3] == "$ cd": # navigate down
      current_dir.add(row.split[2])
    elif row[0].isdigit:
      var next_size = row.split[0].parseInt
      var path = ""
      for dir in current_dir:
        path = path & "/" & dir
        discard folders.hasKeyOrPut(path, 0)
        folders[path] = folders[path] + next_size

  return folders

echo "Answer Part 1: ", get_folders(data).values.toSeq.filterIt(it < 100000).sum
echo "Answer Part 2: ", get_folders(data).values.toSeq.filterIt(get_folders(data)["//"] - it <= 40000000).min