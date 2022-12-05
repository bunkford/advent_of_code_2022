import os, strutils, sequtils

var data = (getAppDir() / "aoc_2022_04.txt").lines.toSeq.mapIt(it.split(",").mapIt(it.split('-').mapIt(it.parseInt)).mapIt(toSeq(it[0]..it[1])))

proc part1(data: seq[seq[seq[int]]]):int =
  for ranges in data:
    if ranges[0].filterIt(it notin ranges[1]).len == 0 or ranges[1].filterIt(it notin ranges[0]).len == 0: result.inc 1

proc part2(data:seq[seq[seq[int]]]):int =
  for ranges in data:
    if ranges[0].filterIt(it notin ranges[1]).len < ranges[0].len or ranges[1].filterIt(it notin ranges[0]).len < ranges[1].len: result.inc 1

echo "Answer Part 1: ", part1(data)
echo "Answer Part 2: ", part2(data)