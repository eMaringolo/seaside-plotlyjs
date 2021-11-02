Extension { #name : #Symbol }

{ #category : #'*Seaside-Plotly-Core' }
Symbol >> asGetter [
	self isKeyword
		ifFalse: [ self error: 'Only keywords can be turn into getters.' ].
	self numArgs = 0
		ifTrue: [ ^ self ].
	self numArgs = 1
		ifTrue: [ ^ (self copyFrom: 1 to: self size - 1) asSymbol ].
	self
		error: 'Only a single argument setter can be converted into a getter.'
]
