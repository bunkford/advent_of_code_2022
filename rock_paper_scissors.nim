import os, sequtils, strutils

type Move = enum Rock = 1, Paper, Scissor, Draw

proc to_enum(c:string):Move =
  case c:
    of "A", "X": return Rock
    of "B", "Y": return Paper
    of "C", "Z": return Scissor

proc what_wins(a, b:Move):Move =
  case abs(ord(b) - ord(a)):
    of 0: return Draw
    of 1: return max(a, b)
    else: return min(a, b)

let moves = (getAppDir() / "aoc_2022_02.txt").lines.toSeq.mapIt(it.split(" ").mapIt(it.to_enum))

proc part1(moves: seq[seq[Move]]):int =
  for move in moves:
    var winner = what_wins(move[0], move[1])
    if winner == Draw: result.inc ord(move[1]) + 3 # draw
    elif winner == move[1]: result.inc ord(move[1]) + 6 # win
    else: result.inc ord(move[1]) # loss

echo "Answer Part 1: ", part1(moves)
