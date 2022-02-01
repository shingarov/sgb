Class {
	#name : #LaddersTest,
	#superclass : #TestCase,
	#category : #StanfordGraphBase
}

{ #category : #tests }
LaddersTest >> testCreateGraph [
	self ladderGraphFrom: self words
]

{ #category : #tests }
LaddersTest >> testDistanceTo [
	self assert: ('abc' distanceTo: 'abd') equals: 1.
	self assert: ('anna' distanceTo: 'alma') equals: 2.
]

{ #category : #tests }
LaddersTest >> testSimilarNonString [
	self assert: (#(1 2 3 4 5) isSimilarTo:  #(1 2 0 4 5)).
	self deny:   (#(1 2 3 4 5) isSimilarTo:  #(1 2 0 0 0)).
]

{ #category : #tests }
LaddersTest >> testSimilarTo [
	self assert: ('abc' distanceTo: 'abd') equals: 1.
	self assert: ('anna' distanceTo: 'alma') equals: 2.
]

{ #category : #'mock objects' }
LaddersTest >> words [
	| f |
	"hardcode path for now, as self package iceRepository --> walkbacks"
	f := '/home/boris/PHARO-ALL/sprite/pharo-local/iceberg/sgb/knuth/words.dat' asFileReference readStream.
	^f contents lines
		reject: [ :line | line first = $* ]
		thenCollect: [ :line | line copyFrom: 1 to: 5 ]

]
