Class {
	#name : #StanfordGraphTest,
	#superclass : #TestCase,
	#category : #StanfordGraphBase
}

{ #category : #tests }
StanfordGraphTest >> test1 [ 
	self words
]

{ #category : #tests }
StanfordGraphTest >> words [
	^(ZnClient new get: 'https://www-cs-faculty.stanford.edu/~knuth/sgb-words.txt') lines
]
