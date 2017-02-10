# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

import times, os, strutils, math, bigints, tables

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = (epochTime() - t0)*1000
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 4)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, " ms"


var trans = {0: 0, 1: 3, 2: 3, 3: 5, 4: 4, 5: 4, 6: 3, 7: 5, 8: 5, 9: 4, 10: 3, 11: 6, 12: 6, 13: 8, 14: 8, 15: 7, 16: 7, 17: 9, 18: 8, 19: 8, 20: 6, 30: 6, 40: 5, 50: 5, 60: 5, 70: 7, 80: 6, 90: 6}.toTable()

proc getLen(n: int): int =
  if n <= 20:
    return trans[n]
  elif n < 100:
    let tens = n div 10
    let ones = n mod 10
    return trans[tens * 10] + trans[ones]
  elif n < 1000:
    let hundreds = n div 100
    let rest = n mod 100
    if rest == 0:
      return getLen(hundreds) + 7
    return getLen(hundreds) + 7 + 3 + getLen(rest)
  else:
    let thousands = n div 1000
    let rest = n mod 1000
    return getLen(thousands) + 8 + getLen(rest)


const limit = 1000
var c = 0

benchmark "runtime":
  for n in 1..limit:
    c += getLen(n)
    echo n, " => ", c