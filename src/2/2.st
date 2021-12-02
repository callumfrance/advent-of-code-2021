#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/2
"

fileName := 'input.txt'.
stream := (FileStream open: fileName mode: FileStream read).
commands := OrderedCollection new.

[stream atEnd] whileFalse:[
  | eachLine y |
  eachLine := stream nextLine.
  y := eachLine subStrings: ' '.
  y at: 2 put: ((y at: 2) asNumber).
  commands add: y.
].

stream close.

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

  determineMultiple [
    ^ (vertical * horizontal)
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

  down: change [
  <comment: 'reposition the sub closer to seabed'>
    coords moveVertical: change.
  ]

  up: change [
  <comment: 'reposition the sub closer to surface'>
    self down: (change * -1).
  ]

  forward: change [
  <comment: 'move forwards by an amount'>
    coords moveHorizontal: change.
  ]
]

sub := Submarine new.

(1 to: (commands size)) do: [ :i |
  | magnitude direction switch |
  direction := ((commands at: i) at: 1).
  magnitude := ((commands at: i) at: 2).

  switch := Dictionary new.
  switch at: 'forward' put: [sub forward: magnitude].
  switch at: 'up' put: [sub up: magnitude].
  switch at: 'down' put: [sub down: magnitude].
  result := (switch at: direction) value.
].

sub coords determineMultiple printNl.