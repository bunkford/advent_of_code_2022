import os, strutils, sets, sequtils

var part1:int
for line in (getAppDir() / "aoc_2022_03.txt").lines:
  for c in line[0..line.high div 2]:
    if c in line[line.high div 2 + 1..^1]: 
      if c.isLowerAscii: 
        part1.inc ord(c) - 96
      else: 
        part1.inc ord(c) -  38
      break

var part2:int
var l:int
var rucksacks:seq[string]
for line in (getAppDir() / "aoc_2022_03.txt").lines:
  rucksacks.add(line)
  l.inc
  if rucksacks.len == 3:
    for c in rucksacks[0]:
      if c in rucksacks[1] and c in rucksacks[2]:
        if c.isLowerAscii: 
          part2.inc ord(c) - 96
        else: 
          part2.inc ord(c) -  38
        break
    
    l = 0
    rucksacks = @[]


echo "Answer Part 1: ", part1
echo "Answer Part 2: ", part2