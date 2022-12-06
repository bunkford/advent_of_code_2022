import deques, sequtils, os

proc part1(data: Deque[char], dis: int): int =
  var buffer = data
  var read = initDeque[char]()
  # add first 4
  while read.len < dis:
    read.addLast(buffer.popFirst)

  while read.items.toSeq[^dis..^1].deduplicate.len < dis:
    read.addLast(buffer.popFirst)
  return read.len

echo "Answer Part 1: ", part1(readFile(getAppDir() / "aoc_2022_06.txt").toDeque, 4)
echo "Answer Part 2: ", part1(readFile(getAppDir() / "aoc_2022_06.txt").toDeque, 14)