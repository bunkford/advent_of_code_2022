import os, strutils

var total:int
var highest:int
for line in (getAppDir() / "aoc_2022_01.txt").lines:
  if line == "": 
    if total > highest: highest = total
    total = 0
  else:
    total.inc line.parseInt

echo "Answer Part 1: ", highest
