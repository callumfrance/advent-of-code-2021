#! /usr/bin/gst

| fileName stream eachLine|

fileName := 'input.txt'.

stream := (FileStream open: fileName mode: FileStream read).

depths := OrderedCollection new.

[stream atEnd] whileFalse:[
  eachLine := stream nextLine.
  depths add: eachLine.
].

stream close.

Transcript show: 'Size of depths is ', depths size asString.