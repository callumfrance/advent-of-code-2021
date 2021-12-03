#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/3
"

| fileName stream binary |

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
binary := OrderedCollection new.

[stream atEnd] whileFalse:[
  | eachLine y |
  eachLine := stream nextLine.
  binary add: eachLine.
].

stream close.


Object subclass: Diagnostics [
  | gammaRate epsilonRate |

  Diagnostics class >> new [ ^ self basicNew initialize. ]

  initialize [ gammaRate := 0. epsilonRate := 0. ]

  gammaRate [ ^ gammaRate ]
  epsilonRate [ ^ epsilonRate ]
  powerConsumption [ ^ gammaRate * epsilonRate. ]

  setGammaRate: inGammaRate [ gammaRate := inGammaRate. ]
  setEpsilonRate: inEpsilonRate [ epsilonRate := inEpsilonRate. ]
]

Object subclass: InputManipulation [
  
  " 
  not sure if there is a native way to convert binary strings into raw binary,
  but there is the bitwise specification
  e.g. 16rFF = 255

  convert a string to a binary value
  2r<VALUE>

  iterate through each character in the string in reverse
  add to the value somehow
  "

]

x := Diagnostics new.
x setGammaRate: 5.
x setEpsilonRate: 7.