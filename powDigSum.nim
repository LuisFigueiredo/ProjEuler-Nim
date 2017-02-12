# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

import libs/benchmark, strutils, math, bigints

proc sumdigits(n: BigInt, base: BigInt): BigInt =
  var n = n
  while n > 0:
    result += n mod base
    n = n div base


benchmark "runtime":
  const pow = 1000

  var i = initBigInt(2)
  for x in 2..pow:
    i *= 2
  echo sumdigits(i, 10.initBigInt)