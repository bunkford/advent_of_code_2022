import os, strutils, sequtils

var data = (getAppDir() / "aoc_2022_05.txt").lines.toSeq.mapIt(it.split(" "))

#[ 
Test Stack
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 
]#

var ts = @[@["Z", "N"],
           @["M","C", "D"],
           @["P"]]

#[
Stack
[H]                 [Z]         [J]
[L]     [W] [B]     [G]         [R]
[R]     [G] [S]     [J] [H]     [Q]
[F]     [N] [T] [J] [P] [R]     [F]
[B]     [C] [M] [R] [Q] [F] [G] [P]
[C] [D] [F] [D] [D] [D] [T] [M] [G]
[J] [C] [J] [J] [C] [L] [Z] [V] [B]
[M] [Z] [H] [P] [N] [W] [P] [L] [C]
 1   2   3   4   5   6   7   8   9 
]#
var s = @[@["M","J","C","B","F","R","L","H"], 
          @["Z","C","D"], 
          @["H","J","F","C","N","G","W"], 
          @["P","J","D","M","T","S","B"], 
          @["N","C","D","R","J"],
          @["W","L","D","Q","P","J","G","Z"],
          @["P","Z","T","F","R","H"],
          @["L","V","M","G"],
          @["C" ,"B" ,"G","P","F","Q","R","J"]]


proc part1(moves: seq[seq[string]], stacks:seq[seq[string]]):string =
  var s = stacks
  for move in moves:
    var qty = move[1].parseInt # quantity to move
    var fr = move[3].parseInt - 1 # from stack
    var to = move[5].parseInt - 1 # to stack
    for i in 1 .. qty:
      s[to].add(s[fr].pop)
  return s.mapIt(@[it[^1]].join).join # return top one from each stack, joines as string

proc part2(moves:seq[seq[string]], stacks:seq[seq[string]]):string =
  var s = stacks
  for move in moves:
    var qty = move[1].parseInt # quantity to move
    var fr = move[3].parseInt - 1 # from stack
    var to = move[5].parseInt - 1 # to stack
    for i in 1 .. qty:
      s[to].insert(s[fr].pop, s[to].len - i + 1)
  return s.mapIt(@[it[^1]].join).join # return top one from each stack, joines as string

echo "Answer Part 1: ", part1(data, s)
echo "Answer Part 2: ", part2(data, s) 