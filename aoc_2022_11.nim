import sequtils, strutils, algorithm, math, os

type Monkey* = object
  items: seq[BiggestInt]
  operation: string
  test:BiggestInt
  iftrue:int
  iffalse:int
  inspect_count:int

proc init*(self:var Monkey, monkey_do:string):Monkey =
  var monkey_stats = monkey_do.split("\n")
  self.items = monkey_stats[1][18..^1].split(", ").mapIt(it.parseBiggestInt)
  self.operation = monkey_stats[2][19..^1]
  self.test = monkey_stats[3][21..^1].parseBiggestInt
  self.iftrue = monkey_stats[4][29..^1].parseInt
  self.iffalse = monkey_stats[5][30..^1].parseInt
  self.inspect_count = 0

  return self

proc eval(value: string): BiggestInt =
  var p = value.split
  var l = p[0].parseBiggestInt
  var r = p[2].parseBiggestInt
  case p[1]:
    of "*":
      result = l * r
    of "/": 
      result = l div r
    of "-": 
      result = l - r
    of "+": 
      result = l + r
    else:
      discard

proc play_a_game(rounds:int, worry_divider:int):uint64 =
  var monkeys:seq[Monkey]
  for m in (getAppDir() / "aoc_2022_11.txt").readFile.split("\n\n"):
    var monkey:Monkey
    monkeys.add(monkey.init(m))

  for i in 1 .. rounds:
    for b in 0 .. monkeys.high:
      while monkeys[b].items.len > 0:
        monkeys[b].inspect_count.inc 1
        var worry = eval(monkeys[b].operation.replace("old",$(monkeys[b].items[0])))
        monkeys[b].items.delete(0)
        worry = if worry_divider == 1: worry mod 9699690 else: floorDiv(worry, worry_divider)
        if floorMod(worry, monkeys[b].test) == 0: monkeys[monkeys[b].iftrue].items.add(worry) else: monkeys[monkeys[b].iffalse].items.add(worry)


  var inspections: seq[uint64]
  for m in monkeys:
    inspections.add(uint64 m.inspect_count)
  inspections.sort()
  return inspections[^2] * inspections[^1]

echo "Answer Part 1: ", play_a_game(20, 3)
echo "Answer Part 2: ", play_a_game(10000, 1)