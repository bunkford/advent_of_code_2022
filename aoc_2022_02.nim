import os, sequtils, strutils

# only 9 possible combinations, I hear elfs like if statements

proc part1(data:seq[seq[string]]): int =
  for round in data:
    if round[0] == "A" and round[1] == "X": result.inc 4   # you chose rock and tied (1+3=4)
    elif round[0] == "A" and round[1] == "Y": result.inc 8 # you chose paper and won (2+6=8)
    elif round[0] == "A" and round[1] == "Z": result.inc 3 # you chose scissors and lost (3+0=3)
    elif round[0] == "B" and round[1] == "X": result.inc 1 # you chose rock and lost (1+0=1)
    elif round[0] == "B" and round[1] == "Y": result.inc 5 # you chose paper and tied (2+3=5)
    elif round[0] == "B" and round[1] == "Z": result.inc 9 # you chose scissors and won (3+6=9)
    elif round[0] == "C" and round[1] == "X": result.inc 7 # you chose rock and won (1+6=7)
    elif round[0] == "C" and round[1] == "Y": result.inc 2 # you chose paper and lost (2+0=2)
    elif round[0] == "C" and round[1] == "Z": result.inc 6 # you chose scissors and tied (3+3=6)

proc part2(data:seq[seq[string]]): int = 
  for round in data:
    if round[0] == "A" and round[1] == "X": result.inc 3   # you need to lose, rock beat scissors (3+0=3)
    elif round[0] == "A" and round[1] == "Y": result.inc 4 # you need to draw, rock ties rock (1+3=4)
    elif round[0] == "A" and round[1] == "Z": result.inc 8 # you need to win, rock loses paper (2+6=8)
    elif round[0] == "B" and round[1] == "X": result.inc 1 # you need to lose paper beats rock (1+0=1)
    elif round[0] == "B" and round[1] == "Y": result.inc 5 # you need to draw paper ties paper (2+3=5)
    elif round[0] == "B" and round[1] == "Z": result.inc 9 # you need to win paper loses scissors (3+6=9) 
    elif round[0] == "C" and round[1] == "X": result.inc 2 # you need to lose scissors beat paper (2+0=2)
    elif round[0] == "C" and round[1] == "Y": result.inc 6 # you need to draw scissors ties scissors (3+3=6) 
    elif round[0] == "C" and round[1] == "Z": result.inc 7 # you need to win scissors loses rock (1+6=7)

let data = (getAppDir() / "aoc_2022_02.txt").lines.toSeq.mapIt(it.split(" "))

echo "Answer Part 1: ", part1(data)

echo "Answer Part 2: ", part2(data)