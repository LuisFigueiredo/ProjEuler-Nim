# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

import times, os, strutils, math, bigints

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = epochTime() - t0
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"

proc nPaths(w, h: int): auto =
  result = initBigInt(1)
  for i in w..<(w+h-1):
    result *= initBigInt(i)
    result = result div initBigInt(i-w+1)


benchmark "runtime":
  # 20x20 grid = 21x21 matrix
  const
    w: int = 21
    h: int = 21

  echo nPaths(w, h)