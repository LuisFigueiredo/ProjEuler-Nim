# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# generate pyth triplet
# a = 2pq
# b = p^2 - q^2
# c = p^2 + q^2
# p and q with p > q, no common divisors and cannot both be odd


import times, os, strutils

template benchmark(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = epochTime() - t0
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"

proc gcd(n1, n2: int): int =
  var
    t: int
    a = n2
  result = n1
  
  while a != 0:
    t = result
    result = a
    a = t mod a

proc relPrime(a, b: int): bool =
  result = (gcd(a, b) == 1)


var sum: int = 1000

benchmark "runtime": 
  for p in 1..20:
    for q in 1..p-1:
      #if((relPrime(p, q)) and ((p mod 2 == 0) or q mod 2 == 0)):
        let a = p*p - q*q
        let b = 2 * p * q
        let c = p*p + q*q
        echo a, "\t+ ", b, "\t+ ", c, "\t=\t", a+b+c
        if(a+b+c == sum):
          echo "==>", a*b*c