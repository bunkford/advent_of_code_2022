import strutils, math, algorithm

type 
  Monkey = object
    items: seq[int]
    operation: string
    divisible_by: int
    test_true: int
    test_false: int
    total_inspections: int

proc eval(value: string): float64 =
  var p = value.split
  case p[1]:
    of "*":
      result = float64 p[0].parsefloat * p[2].parsefloat
    of "/": 
      result = float64 p[0].parsefloat / p[2].parsefloat
    of "-": 
      result = float64 p[0].parsefloat - p[2].parsefloat
    of "+": 
      result = float64 p[0].parsefloat + p[2].parsefloat



var monkeys:seq[Monkey]
monkeys.add(Monkey(total_inspections: 0, items: @[85, 79, 63, 72], operation:"old * 17", divisible_by: 2, test_true: 2, test_false: 6))
monkeys.add(Monkey(total_inspections: 0, items: @[53, 94, 65, 81, 93, 73, 57, 92], operation:"old * old", divisible_by: 7, test_true: 0, test_false: 2))
monkeys.add(Monkey(total_inspections: 0, items: @[62, 63], operation:"old + 7", divisible_by: 13, test_true: 7, test_false: 6))
monkeys.add(Monkey(total_inspections: 0, items: @[57, 92, 56], operation:"old + 4", divisible_by: 5, test_true: 4, test_false: 5))
monkeys.add(Monkey(total_inspections: 0, items: @[67], operation:"old + 5", divisible_by: 3, test_true: 1, test_false: 5))
monkeys.add(Monkey(total_inspections: 0, items: @[85, 56, 66, 72, 57, 99], operation:"old + 6", divisible_by: 19, test_true: 1, test_false: 0))
monkeys.add(Monkey(total_inspections: 0, items: @[86, 65, 98, 97, 69], operation:"old * 13", divisible_by: 11, test_true: 3, test_false: 7))
monkeys.add(Monkey(total_inspections: 0, items: @[87, 68, 92, 66, 91, 50, 68], operation:"old + 2", divisible_by: 17, test_true: 4, test_false: 3))

var test_monkeys:seq[Monkey]
test_monkeys.add(Monkey(total_inspections: 0, items: @[79, 98], operation:"old * 19", divisible_by: 23, test_true: 2, test_false: 3))
test_monkeys.add(Monkey(total_inspections: 0, items: @[54, 65, 75, 74], operation:"old + 6", divisible_by: 19, test_true: 2, test_false: 0))
test_monkeys.add(Monkey(total_inspections: 0, items: @[79, 60, 97], operation:"old * old", divisible_by: 13, test_true: 1, test_false: 3))
test_monkeys.add(Monkey(total_inspections: 0, items: @[74], operation:"old + 3", divisible_by: 17, test_true: 0, test_false: 1))

proc part1(monkeys:var seq[Monkey], rounds:int):int =

  for i in 1 .. rounds:
    for m in 0 .. monkeys.high:
      for i in 0 .. monkeys[m].items.high:
        monkeys[m].total_inspections.inc
        var item = monkeys[m].items[0]
        monkeys[m].items.delete(0)
        if floor(eval(monkeys[m].operation.replace("old", $item)) / 3) mod float64(monkeys[m].divisible_by) == 0:
          monkeys[monkeys[m].test_true].items.add(int floor(eval(monkeys[m].operation.replace("old", $item)) / 3))
        else:
          monkeys[monkeys[m].test_false].items.add(int floor(eval(monkeys[m].operation.replace("old", $item)) / 3))
    

  var inspections: seq[int]
  for m in monkeys:
    inspections.add(m.total_inspections)
  inspections.sort()
  result = inspections[^2] * inspections[^1]


echo "Answer Part 1: ", part1(monkeys, 20)
