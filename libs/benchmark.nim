import times, os, strutils

template benchmark*(benchmarkName: string, code: typed) =
  let t0 = epochTime()
  code
  let elapsed = (epochTime() - t0) * 1000 # converted to ms
  let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 4)
  echo "CPU Time [", benchmarkName, "] ", elapsedStr, " ms"