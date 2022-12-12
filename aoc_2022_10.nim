import os, strutils, sequtils, sets, tables, math, algorithm

var data = (getAppDir() / "aoc_2022_10.txt").lines.toSeq.mapIt(it.split)


type Clock* = object
  cycle:int
  signal_strength:int
  crt:seq[string]

proc init*(clock:var Clock) =
  clock.cycle = 0
  clock.signal_strength = 0
  clock.crt = @[".".repeat(240)]

proc inc*(clock:var Clock, x:int) =
  clock.cycle.inc
  if clock.cycle in [20, 60, 100, 140, 180, 220]:
    clock.signal_strength.inc x * clock.cycle

proc inc2*(clock:var Clock, pos:int) =
  if clock.cycle mod 40 in [pos - 1, pos, pos + 1]:
    clock.crt[0][clock.cycle] = '#'
  clock.cycle.inc

proc display*(clock:var Clock) =
  for row in 0..5:
    var s = row * 40
    var e = s + 40
    echo clock.crt[0][s..e-1]

proc part1(data:seq[seq[string]]):int =
  var x:int = 1
  var clock:Clock
  clock.init
  for line in data:
    case line[0]:
      of "noop":
        clock.inc x
      of "addx":
        clock.inc x
        clock.inc x
        x.inc line[1].parseInt
  return clock.signal_strength

proc part2(data:seq[seq[string]]):int =
  var x:int = 1
  var clock:Clock
  clock.init
  for line in data:
    case line[0]:
        of "noop":
          clock.inc2 x
        of "addx":
          clock.inc2 x
          clock.inc2 x
          x.inc line[1].parseInt
  clock.display


echo "Answer Part 1: ", part1(data)
echo "Answer Part 2: ", part2(data) 