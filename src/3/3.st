#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/3
"

Object subclass: Diagnostics [
  | gammaRate epsilonRate oxygenRating carbonRating |

  Diagnostics class >> new [ ^ self basicNew initialize. ]

  initialize [ gammaRate := 0. epsilonRate := 0. ]

  gammaRate [ ^ gammaRate ]
  epsilonRate [ ^ epsilonRate ]
  oxygenRating [ ^ oxygenRating ]
  carbonRating [ ^ carbonRating ]
  powerConsumption [ ^ gammaRate * epsilonRate. ]
  lifeSupportRating [ ^ oxygenRating * carbonRating ]

  setGammaRate: inGammaRate [ gammaRate := inGammaRate. ]
  setEpsilonRate: inEpsilonRate [ epsilonRate := inEpsilonRate. ]
  setOxygenRating: in [ oxygenRating := in. ]
  setCarbonRating: in [ carbonRating := in. ]
]

| fileName stream lineLength binary dumbString dumberString d |

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
lineLength := (stream nextLine) size.
binary := Array new: lineLength.
(1 to: lineLength) do: [:i | binary at: i put: 0 ].
stream position: 0.

[stream atEnd] whileFalse: [
  | eachLine index |
  eachLine := stream nextLine.
  index := 1.

  eachLine do: [:a |

    binary at: index put:
      (((a asString asNumber) = 0)
        ifTrue: [(binary at: index) - 1]
        ifFalse: [(binary at: index) + 1]).

    index := index + 1.
  ].
].

stream close.

dumbString := ''.
dumberString := ''.

binary do: [:a | (a < 0)
  ifTrue: [
    dumbString := dumbString, '0'.
    dumberString := dumberString, '1'
    ]
  ifFalse: [
    dumbString := dumbString, '1'.
    dumberString := dumberString, '0'
    ]
].

d := Diagnostics new.
d setGammaRate: (Number readFrom: (ReadStream on: dumbString) radix: 2).
d setEpsilonRate: (Number readFrom: (ReadStream on: dumberString) radix: 2).
d powerConsumption printNl.