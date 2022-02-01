Extension { #name : #SequenceableCollection }

{ #category : #'*StanfordGraphBase' }
SequenceableCollection >> distanceTo: anotherWord [
	^(self withIndexSelect: [ :char :index | (anotherWord at: index) ~= char ]) size
]

{ #category : #'*StanfordGraphBase' }
SequenceableCollection >> isSimilarTo: anotherSequence [
	"Answer whether the receiver is one step away from anotherSequance
	 in Lewis Carrols's Ladder game.
	Assume both words are of the same size."
	^(self distanceTo: anotherSequence) = 1
]
