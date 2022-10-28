#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/7
"

" fileName := 'test.txt'. "
fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
horizontalPositions := SortedCollection new.

[stream atEnd] whileFalse:[
  | eachLine positions |
  eachLine := stream nextLine.
  y := eachLine subStrings: ','.

  (1 to: (y size)) do: [ :i |
    horizontalPositions add: ((y at: i) asInteger).
  ].
].

stream close.

cleanDivide := ((horizontalPositions size) \\ 1) == 0.
midPoint := (horizontalPositions size) // 2. 
median := 0.

cleanDivide ifTrue: [
  median := horizontalPositions at: midPoint.
].

cleanDivide ifFalse: [
  median := ((horizontalPositions at: midPoint) + (horizontalPositions at: (midPoint + 1))) / 2.
].

fuelCost := 0.

(1 to: horizontalPositions size) do: [ :i |
  fuelCost := fuelCost + (((horizontalPositions at: i) - median) abs).
].

fuelCost printNl.