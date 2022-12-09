import os, strutils, sequtils, math, algorithm

var data = (getAppDir() / "aoc_2022_08.txt").lines.toSeq.mapIt(it.toSeq.mapIt(($it).parseInt))

proc transpose[T](tbl: seq[seq[T]]): seq[seq[T]] =
  let inputDim: (int, int) = (tbl[1].high, tbl.high)
  doAssert(inputDim[0] > 0 and inputDim[1] > 0)
  for x in 0 .. inputDim[0]:
    var row: seq[T]
    for y in 0 .. inputDim[1]:
      row.add(tbl[y][x])
    result.add(row)

proc scenicScore(grid: seq[seq[int]], x: int, y: int): int =
  var n, e, s, w: int
  let height = grid[x][y]
  for r in countdown(x - 1, 0):
    n.inc
    if grid[r][y] >= height: break
  for c in countup(y + 1, grid[0].high):
    e.inc
    if grid[x][c] >= height: break
  for r in countup(x + 1, grid.high):
    s.inc
    if grid[r][y] >= height: break
  for c in countdown(y - 1, 0):
    w.inc
    if grid[x][c] >= height: break
  
  return n * e * s * w

var horizontal = data
var vertical = data.transpose

var size = horizontal.high
var visible_trees = 0
var highest_score = 0
for y in 0..size:
    for x in 0..size:
        var height = horizontal[y][x]
        var row = horizontal[y]
        var col = vertical[x]
        var directions = [
            row[0..x].reversed,
            row[x..row.high],
            col[0..y].reversed,
            col[y..col.high]
        ]      
                
        if directions.mapIt(it[1..^1]).anyIt(it.len == 0 #[ edge ]# or height > max(it) #[ interior ]#): visible_trees.inc
        
        
        highest_score = max(highest_score, scenic_score(data, x, y))


echo "Answer Part 1: ", visible_trees
echo "Answer Part 2: ", highest_score
