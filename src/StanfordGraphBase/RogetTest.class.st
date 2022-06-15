Class {
	#name : #RogetTest,
	#superclass : #TestCase,
	#category : #StanfordGraphBase
}

{ #category : #private }
RogetTest >> lines [
	"hardcode path for now, as self package iceRepository --> walkbacks"
	^'/home/boris/PHARO-ALL/sprite/pharo-local/iceberg/sgb/roget_j.dat'
			asFileReference readStream contents lines
]

{ #category : #'mock objects' }
RogetTest >> roget [
	<gtExample>
	^Graph fromTriples: self triples
]

{ #category : #tests }
RogetTest >> testCreateGraph [ 
	| g |
	g := self roget.
	self assert: g numVertices equals: 1022.
	self assert: (g keyForNode: 'ascent') equals: 312.
	self assert: (g outdegreeOf: 312) equals: 3.
	self assert: (g keyForNode: 'obliquity') equals: 224.
	self assert: (g keyForNode: 'descent') equals: 313.
	self assert: (g keyForNode: 'leap') equals: 316.
]

{ #category : #tests }
RogetTest >> testSCC [
	| g scc trees |
	g := self roget.
	scc := g scc.
	trees := scc trees.
	self assert: trees size equals: 77.
	self assert: (trees select: [ :tree | tree subtrees isEmpty ]) size equals: 39.
	self assert: (trees reject: [ :tree | tree subtrees isEmpty ]) size equals: 38
]

{ #category : #private }
RogetTest >> triples [
	^self lines collect: [ :line |
		| lr l lastLetterIndex i name adjacent |
		lr := $: split: line.
		l := lr first.
		lastLetterIndex := l findLast: #isDigit.
		i := (l first: lastLetterIndex) asInteger.
		name := l last: l size - lastLetterIndex.
		adjacent := $  split: lr last.
		adjacent := adjacent collect: #asInteger.
		{ i. adjacent. name. }
	]
]
