#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/1
"

| fileName stream depths increasingCount slidingWindowCount sum3 |

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
depths := OrderedCollection new.

[stream atEnd] whileFalse:[
  | eachLine |
  eachLine := stream nextLine asInteger.
  depths add: eachLine.
].

stream close.

"
Simple comparison section
"
increasingCount := 0

(1 to: ((depths size) - 1)) do: [
  :i | ((depths at: i) < (depths at: i + 1))
    ifTrue: [increasingCount := increasingCount + 1].
].

increasingCount printNl.

"
Three point moving average section.
"
slidingWindowCount := 0

(1 to: ((depths size) - 3)) do: [ :i |
    sum3 := [:a :b :c | a + b + c].

    (sum3 value: (depths at: i) value: (depths at: i + 1) value: (depths at: i + 2)) <
    (sum3 value: (depths at: i + 1) value: (depths at: i + 2) value: (depths at: i + 3))
      ifTrue: [slidingWindowCount := slidingWindowCount + 1].
].

slidingWindowCount printNl.