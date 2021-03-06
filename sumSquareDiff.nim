# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

import libs/benchmark, strutils, math, sequtils

benchmark "runtime":
  var vect: seq[int] = @[]
  for i in countup(0, 100):
    vect.add(i)
  let sumSq = sum(map(vect, proc (x: int): int = x*x))
  let tmp = sum(vect)
  let sqSum = tmp*tmp

  echo sqSum, " - ", sumSq, " = ", abs(sumSq - sqSum)