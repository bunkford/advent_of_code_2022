import os, sequtils, strutils

type Move = enum Rock = 1, Paper, Scissor, Draw

proc to_enum(c:string):Move =
  case c:
    of "A", "X": Rock
    of "B", "Y": Paper
    of "C", "Z": Scissor
    else: raise

proc what_wins(a, b:Move):Move =
  case abs(ord(b) - ord(a)):
    of 0: Draw
    of 1: max(a, b)
    else: min(a, b)

let moves = (getAppDir() / "aoc_2022_02.txt").lines.toSeq.mapIt(it.split(" ").mapIt(it.to_enum))

proc part1(moves: seq[seq[Move]]):int =
  for move in moves:
    var winner = what_wins(move[0], move[1])
    if winner == Draw: result.inc ord(move[1]) + 3 # draw
    elif winner == move[1]: result.inc ord(move[1]) + 6 # win
    else: result.inc ord(move[1]) # loss

proc part2(moves: seq[seq[Move]]):int =
  # Rock means you need to lose, 
  # Paper means you need to end the round in a draw
  # Scissors means you need to win
  for move in moves:
    case move[1]:
      of Rock: # lose
        for i in Move: 
          if what_wins(move[0], i) notin [Draw, move[1]]: 
            result.inc ord(what_wins(move[0], i))
            break
      of Paper: 
        result.inc ord(move[0]) + 3
      of Scissor:
        for i in Move:
          if what_wins(move[0], i) == i:
            result.inc ord(i) + 6
            break
      else:
        discard

echo "Answer Part 1: ", part1(moves)
echo "Answer Part 2: ", part2(moves)