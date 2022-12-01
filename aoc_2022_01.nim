import os, strutils, algorithm

var total:int
var highest:int
var totals:seq[int]
for line in (getAppDir() / "aoc_2022_01.txt").lines:
  if line == "": 
    totals.add(total)
    if total > highest: highest = total
    total = 0
  else:
    total.inc line.parseInt

totals.sort()

echo "Answer Part 1: ", highest
echo "Answer Part 2: ", totals[^1] + totals[^2] + totals[^3]