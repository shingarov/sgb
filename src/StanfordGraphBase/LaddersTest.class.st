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

{ #category : #tests }
LaddersTest >> words [
	^(ZnClient new get: 'https://www-cs-faculty.stanford.edu/~knuth/sgb-words.txt') lines
]
