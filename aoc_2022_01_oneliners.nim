import sequtils, os, strutils, algorithm

# one liners because why not?
echo "Answer Part 1: ", readfile(getAppDir() / "aoc_2022_01.txt").split("\n\n").mapIt(it.split("\n").mapIt(it.parseInt)).mapIt(it.foldr(a + b)).sorted()[^1]
echo "Answer Part 1: ", readfile(getAppDir() / "aoc_2022_01.txt").split("\n\n").mapIt(it.split("\n").mapIt(it.parseInt)).mapIt(it.foldr(a + b)).sorted()[^3..^1].foldr(a + b)
