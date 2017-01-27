# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

import times, os, strutils, math

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = epochTime() - t0
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"

iterator isoe_upto(top: uint): uint =
    let topndx = int((top - 3) div 2)
    let sqrtndx = (int(sqrt float64(top)) - 3) div 2
    var cmpsts = newSeq[uint32](topndx div 32 + 1)
    for i in 0..sqrtndx: # cull composites for primes
      if (cmpsts[i shr 5] and (1u32 shl (i and 31))) == 0:
        let p = i + i + 3
        for j in countup((p * p - 3) div 2, topndx, p):
          cmpsts[j shr 5] = cmpsts[j shr 5] or (1u32 shl (j and 31))
    yield 2 # separate culling above and iteration here
    for i in 0..topndx:
      if (cmpsts[i shr 5] and (1u32 shl (i and 31))) == 0:
        yield uint(i + i + 3)

benchmark "runtime":
  var sum: uint = 0
  for p in isoe_upto(2_000_000):
    sum += p
  
  echo sum