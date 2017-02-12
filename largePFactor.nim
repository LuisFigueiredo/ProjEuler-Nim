# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

import libs/benchmark, strutils, math, sequtils, times
 
proc getStep(n: int64) : int64 {.inline.} =
  result = 1 + n*4 - int64(n /% 2)*2
 
proc primeFac(n: int64): seq[int64] =    
  var res: seq[int64] = @[]
  var maxq = int64(floor(sqrt(float(n))))
  var d = 1
  var q: int64 = (n %% 2) and 2 or 3    # either 2 or 3, alternating
  while (q <= maxq) and ((n %% q) != 0):
    q = getStep(d)
    d += 1
  if q <= maxq:        
    var q1: seq[int64] = primeFac(n /% q)
    var q2: seq[int64] = primeFac(q)
    res = concat(q2, q1, res)
  else: 
    res.add(n)    
  result = res

benchmark "runtime":
  var f = primeFac(600851475143)
  echo f