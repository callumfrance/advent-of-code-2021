#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/2
"

Object subclass: Coordinates [
  <comment: 'a class that contains horizontal and vertical coordiantes'>
  | horizontal vertical |

  Coordinates class >> new [
    ^ self basicNew initialize
  ]

  initialize [
    vertical := 0.
    horizontal := 0.
  ]

  horizontal [
    ^ horizontal
  ]

  vertical [
    ^ vertical
  ]

  moveHorizontal: change [
    <comment: 'change the horizontal value'>
    horizontal := horizontal + change.
  ]

  moveVertical: change [
    <comment: 'change the vertical value'>
    vertical := vertical + change.
  ]
]

Object subclass: Submarine [
  <comment: 'a class to track the position of a submarine'>
  | coords |

  Submarine class >> new [
    ^ self basicNew initialize
  ]

  initialize [
    coords := Coordinates new.
  ]

  coords [
    ^ coords
  ]

  up: change [
    coords moveVertical: (change * -1).
  ]
]

x := Coordinates new.
x moveHorizontal: 5.
x moveVertical: 7.

x printNl.
x horizontal printNl.
x vertical printNl.

y := Submarine new.
y up: 5.
y coords vertical printNl.