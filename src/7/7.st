#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/7
"

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
horizontalPositions := OrderedCollection new.

[stream atEnd] whileFalse:[
  | eachLine positions |
  eachLine := stream nextLine.
  y := eachLine subStrings: ','.

  (1 to: (y size)) do: [ :i |
    horizontalPositions add: ((y at: i) asInteger).
  ].
].

stream close.

horizontalPositions printNl.