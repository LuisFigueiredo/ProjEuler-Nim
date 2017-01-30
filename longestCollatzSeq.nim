# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

import times, os, strutils

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = epochTime() - t0
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"


const limit = 1_000_000
var
  seqLen = 0
  start = 0
  sequence: int
  cache: array[limit+1, int]

for i in 0..limit:
  cache[i] = -1
cache[1] = 1

benchmark "runtime":
  for i in 2..limit:
    sequence = i
    var k = 0
    while (sequence != 1) and (sequence >= i):
      inc(k)
      if (sequence mod 2 == 0):
        sequence = sequence div 2
      else:
        sequence = sequence * 3 + 1
    
    cache[i] = k + cache[sequence]
    if cache[i] > seqLen:
      seqLen = cache[i]
      start = i
  echo "Longest collatz chain found: ", start