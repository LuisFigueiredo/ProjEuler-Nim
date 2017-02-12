#[
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
]#

import libs/benchmark, strutils, strutils, os, algorithm

const file = "p022_names.txt"
var
  f = open(file, fmRead)
  count = 0
  i = 0

benchmark "runtime":
  let line = (readline(f).string.split({'"'}).join("")) # readline from file and remove '"'
  var splitLine = line.split(',')
  splitLine.sort(proc (x,y: string): int =
    cmp(x, y))
  for name in splitLine:
    inc(i)
    var nameVal = 0
    for ch in name:
      nameVal += ord(ch) - 64
      #echo "\t", ch, " -> ", ord(ch)-64
    count += nameVal * i
    #echo name, " -> ", nameVal
    #echo count
  echo count