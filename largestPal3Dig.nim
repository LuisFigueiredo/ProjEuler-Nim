# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

import sequtils, times, os

proc detectPalindrome(num: int): bool =
  var x:int = num
  if (num < 0):
    return false

  var dv: int = 1
  while (num div dv >= 10):
    dv *= 10

  while (x != 0):
    let left: int = x div dv
    let right:int = x mod 10

    if (left != right):
      return false

    x = (x mod dv) div 10
    dv = dv div 100
  result = true

let t0 = cpuTime()

var pal: seq[int] = @[]
for i in 100..999:
  for j in 100..999:
    let res: int = i*j
    if detectPalindrome(res):
      pal.add(res)

#pal = pal.deduplicate()
echo "Result => ", max(pal)

echo "Runtime => ", cpuTime() - t0, "s"