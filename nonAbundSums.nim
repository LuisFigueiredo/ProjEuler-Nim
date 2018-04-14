#[
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
]#

import libs/benchmark, strutils, sequtils, intsets, math

proc sumProperDivisors(number: int) : int =
  for i in 2 .. floor(sqrt(number.float)).int:
    if(number mod i == 0):
      let x = number div i
      if(i*i == number):
        result += i
      else:
        result += i + x
  result += 1

const
  lim: int = 28_123

var
  isSumOfAbundants: array[lim*2, bool]
  abundants: seq[int] = @[]

benchmark "runtime":

  var
    sum: int = 0

  for i in 12 .. lim:
    if(sumProperDivisors(i) > i):
      abundants.add(i)

  for i in 0 .. abundants.len:
    var j = i
    while j + i < abundants.len:
      isSumOfAbundants[abundants[i] + abundants[j]] = true
      j.inc()

  for i in 0 .. lim*2:
    if(not isSumOfAbundants[i]):
      sum += i

  echo sum