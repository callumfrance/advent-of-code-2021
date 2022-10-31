#! /usr/bin/gst

"
See here for the problem statement
https://adventofcode.com/2021/day/7
"

Object subclass: #ReadCrabPositions
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Advent-2021-7'!
! !

Object subclass: #FindMedian
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Advent-2021-7'!
! !

!ReadCrabPositions class methodsFor: 'reading from file'!

readRawInput: fileName
  "Read in the file and return the raw SortedCollection"
  | stream horizontalPositions |
  stream := (FileStream open: fileName mode: FileStream read).
  horizontalPositions := SortedCollection new.

  [stream atEnd] whileFalse:[
    | eachLine y |
    eachLine := stream nextLine.
    y := eachLine subStrings: ','.

    (1 to: (y size)) do: [ :i |
      horizontalPositions add: ((y at: i) asInteger).
    ].
  ].

  stream close.

  ^horizontalPositions
! !

!FindMedian class methodsFor: 'finding the median of a SortedCollection'!

getMedian: horizontalPositions
  "Gives the median value from a sorted collection"
  | cleanDivide midPoint median |
  cleanDivide := ((horizontalPositions size) \\ 1) == 0.
  midPoint := (horizontalPositions size) // 2.
  median := 0.

  cleanDivide ifTrue: [
    median := horizontalPositions at: midPoint.
  ].

  cleanDivide ifFalse: [
    median := ((horizontalPositions at: midPoint) + (horizontalPositions at: (midPoint + 1))) / 2.
  ].

  ^median.
! !

horizontalPositions := ReadCrabPositions readRawInput: 'src/7/input.txt'.
median := FindMedian getMedian: horizontalPositions.

fuelCost := 0.

(1 to: horizontalPositions size) do: [ :i |
  fuelCost := fuelCost + (((horizontalPositions at: i) - median) abs).
].

fuelCost printNl.