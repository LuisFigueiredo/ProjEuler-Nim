# Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

# 37107287533902102798797998220837590246510135740250
# 46376937677490009712648124896970078050417018260538
# 74324986199524741059474233309513058123726617309629
# 91942213363574161572522430563301811072406154908250
# 23067588207539346171171980310421047513778063246676
# ...
# 53503534226472524250874054075591789781264330331690

import times, os, strutils, bigints

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = epochTime() - t0
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"


if not existsFile "numbers.txt":
  echo "Problem reading the 'numbers.txt' file"
  quit(QuitFailure)

benchmark "runtime":
  var tmp = initBigInt(0)
  for line in lines "numbers.txt":
    tmp += initBigInt(line)

  echo tmp
