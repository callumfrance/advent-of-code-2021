#! /usr/bin/gst

| fileName stream depths moreThanX areOdd|

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
depths := OrderedCollection new.

[stream atEnd] whileFalse:[
  | eachLine |
  eachLine := stream nextLine asInteger.
  depths add: eachLine.
].

stream close.

Transcript show: 'Size of depths is ', depths size asString; cr.

"Figure out how many odd numbers are greater than X in the input"
moreThanX := depths select: [ :each | each > 1000 ].
Transcript show: moreThanX size asString; cr.

"Figure out how many odd numbers are in the input"
areOdd := depths select: [ :each | each odd ].
Transcript show: areOdd size asString; cr.