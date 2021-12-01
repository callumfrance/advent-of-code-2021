#! /usr/bin/gst

| fileName stream depths increasingCount |

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
depths := OrderedCollection new.

[stream atEnd] whileFalse:[
  | eachLine |
  eachLine := stream nextLine asInteger.
  depths add: eachLine.
].

stream close.

increasingCount := 0

(1 to: ((depths size) - 1)) do: [
  :i | ((depths at: i) < (depths at: i + 1))
    ifTrue: [increasingCount := increasingCount + 1].
].

increasingCount printNl.