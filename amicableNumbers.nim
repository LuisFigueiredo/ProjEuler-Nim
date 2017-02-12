#[
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
]#

import libs/benchmark, strutils, sequtils, tables, math, intsets

proc factors(n: int): seq[int] =
  var fs = initIntSet()
  for x in 1 .. int(sqrt(float(n))):
    if n mod x == 0:
      fs.incl(x)
      fs.incl(n div x)
 
  result = @[]
  for x in fs:
    result.add(x)
  #sort(result, system.cmp[int])

var
  ami = initTable[int, int]()
  sum = 0
benchmark "runtime":
  for i in 1..10_000:
    ami[i] = foldl(factors(i), a + b).int - i # factors() returns the number itself as a divisor
    if ami.hasKey(ami[i]) and ami[ami[i]] == i and i != ami[i]:
      sum += i+ami[i]
      echo ami[i], " and ", i
  echo "sum of amicables: ", sum