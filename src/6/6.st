#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/6
"

Object subclass: Lanternfish [
  | spawnRate spawnClock firstCycle |

  Lanternfish class >> new [ ^ self basicNew initialize. ]

  initialize [ 
    spawnRate := 7.
    spawnClock := spawnRate + 1.
    firstCycle := true.
  ]

  spawnClock [ 
    <comment: 'number of days left until a new fish is created'>
    ^ spawnClock.
  ]

  setSpawnClock: in [ spawnClock := in. ]

  dayTick [
    (spawnClock <= 0)
      ifTrue: [
        spawnClock := spawnRate - 1.
        firstCycle := false.
        ^ Lanternfish new.
      ]
      ifFalse: [ spawnClock := spawnClock - 1.].
  ]
]

OrderedCollection subclass: FishSchool [
  <shape: #inherit>
]

x := Lanternfish new.

(1 to: 20) do: [ :a |
  Transcript show: (x spawnClock) asString; cr.
  x dayTick.
].

y := FishSchool new.
z := x dayTick.
y add: x dayTick.
