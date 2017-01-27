# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

import times, os, strutils

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = epochTime() - t0
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"

proc gcd(u, v:int): auto =
  var
    t = 0
    u = u
    v = v
  while v != 0:
    t = u
    u = v
    v = t %% v
  abs(u)
 
proc lcm(a, b: int): auto = abs(a * b) div gcd(a, b)

benchmark "runtime":
  var n = 11
  for i in 12..20:
    n = lcm(i, n)
  echo n
