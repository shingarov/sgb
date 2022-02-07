Class {
	#name : #LaddersTest,
	#superclass : #TestCase,
	#category : #StanfordGraphBase
}

{ #category : #'mock objects' }
LaddersTest >> ladder [
	<gtExample>
	^self ladderGraphFrom: self words
	
]

{ #category : #'mock objects' }
LaddersTest >> ladderGraphFrom: words [
	| d |
	d := Dictionary newFromAssociations: (words collect: [ :w | w -> Set new ]).
	words doWithIndex: [ :word :i |
		1 to: i-1 do: [ :j |
			| prevWord |
			prevWord := words at: j.
			(prevWord isSimilarTo: word) ifTrue: [
				(d at: prevWord) add: word.
				(d at: word) add: prevWord.
			]]].
	^Graph fromDictionary: d
	
]

{ #category : #tests }
LaddersTest >> testBloodTears [
	| g p |
	g := self ladder.
	p := g shortestPathFromNode: 'blood' to: 'tears'.
	self assert: (p includes: 'bears')
	
]

{ #category : #tests }
LaddersTest >> testCreateGraph [
	| g chiffsRelatives |
	g := self ladder.
	chiffsRelatives := (g edgesOutOfVertex: (g vertexForNode: 'chiff')) collect: #value.
	self assert: ((chiffsRelatives collect: [ :v | g nodeAtVertex: v ]) includes: 'cliff')
	
]

{ #category : #tests }
LaddersTest >> testCreateSmallGraph [
	| g |
	g := self ladderGraphFrom: { 'abaca'. 'aback'. 'chiff'. }.
	self assert: g vertices size equals: 3.
	self assert: (g indegreeOf: (g vertexForNode: 'chiff')) equals: 0.
	self assert: (g outdegreeOf: (g vertexForNode: 'chiff')) equals: 0.
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
