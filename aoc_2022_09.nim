import os, strutils, sequtils, sets, tables, math

var data = (getAppDir() / "aoc_2022_09.txt").lines.toSeq

proc one_step(a, b:int):int = 
  if a == b: 0 else: int(abs(a - b)/(a - b))

proc tug_the_rope(data: seq[string], rope_size: int):int =
    var rope = @[0,0].repeat(rope_size)
    var dir_table = {"U": (0, -1), "D": (0, 1), "L": (-1, 0), "R": (1, 0)}.toTable
    var tail_visited = initHashSet[(int, int)]()
    tail_visited.incl((0, 0))

    for line in data:
      rope[^1] = @[rope[^1][0] + line.split[1].parseInt * dir_table[line.split[0]][0], rope[^1][1] + line.split[1].parseInt * dir_table[line.split[0]][1]]
      var anything_moved = true
      while anything_moved:
        anything_moved = false
        for i in countdown(rope.high, 1, 1):
          var head = rope[i]
          var tail = rope[i-1]
          var dist_from_tail = sqrt(float((head[0] - tail[0]) ^ 2 + (head[1] - tail[1]) ^ 2))
          if dist_from_tail < 2.0: break
          tail = @[tail[0] + one_step(head[0], tail[0]), tail[1] + one_step(head[1], tail[1])] # takes one step towards head
          anything_moved = true
          rope[i-1] = tail
        tail_visited.incl((rope[0][0], rope[0][1]))

    return tail_visited.len

echo "Answer Part 1: ", tug_the_rope(data, 2)
echo "Answer Part 2: ", tug_the_rope(data, 10)


