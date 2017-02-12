#[
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
]#

import libs/benchmark, strutils, bigints

proc factorial(x: BigInt): BigInt =
  result = 1.initBigInt
  for i in 1.initBigInt..x.initBigInt:
    result *= i

proc sumdigits(n: BigInt, base: BigInt): BigInt =
  var n = n
  while n > 0:
    result += n mod base
    n = n div base

const
  f: int = 100
  base: int = 10
benchmark "runtime":
  echo sumdigits(factorial(f.initBigInt), base.initBigInt)
