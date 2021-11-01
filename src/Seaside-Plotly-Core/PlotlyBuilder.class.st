Class {
	#name : #PlotlyBuilder,
	#superclass : #JSObject,
	#instVars : [
		'method',
		'containerId',
		'parameters'
	],
	#category : #'Seaside-Plotly-Core-Builder'
}

{ #category : #accessing }
PlotlyBuilder >> config [

	^self parameters config
]

{ #category : #accessing }
PlotlyBuilder >> config: anObject [

	self parameters config: anObject
]

{ #category : #accessing }
PlotlyBuilder >> containerId [

	^containerId
]

{ #category : #accessing }
PlotlyBuilder >> containerId: anObject [

	containerId := anObject
]

{ #category : #accessing }
PlotlyBuilder >> data: anObject [

	self parameters data: anObject
]

{ #category : #accessing }
PlotlyBuilder >> defaultMethod [

	^'newPlot'
]

{ #category : #accessing }
PlotlyBuilder >> downloadImage: id settings: aDictionary [

	self 
		method: 'downloadImage';
		containerId: id;
		parameters: aDictionary;
		yourself
]

{ #category : #initialization }
PlotlyBuilder >> initialize [

	super initialize.
	self initializeParameters
]

{ #category : #initialization }
PlotlyBuilder >> initializeParameters [

	parameters := PlotlyBuilderParameters new
]

{ #category : #printing }
PlotlyBuilder >> javascriptContentOn: aStream [

	aStream
		nextPutAll: self plotlyGlobal;
		nextPut: $.;
		nextPutAll: self method;
		nextPut: $(;
		javascript: self containerId;
		nextPutAll: ', ';
		javascript: self parameters;
		nextPut: $)
]

{ #category : #accessing }
PlotlyBuilder >> layout [

	^self parameters layout
]

{ #category : #accessing }
PlotlyBuilder >> layout: anObject [

	self parameters layout: anObject
]

{ #category : #accessing }
PlotlyBuilder >> method [

	^method ifNil: [method := self defaultMethod]
]

{ #category : #accessing }
PlotlyBuilder >> method: aString [

	method := aString
]

{ #category : #accessing }
PlotlyBuilder >> parameters [

	^parameters
]

{ #category : #accessing }
PlotlyBuilder >> parameters: anObject [

	parameters := anObject
]

{ #category : #accessing }
PlotlyBuilder >> plotlyGlobal [

	^'Plotly'
]

{ #category : #accessing }
PlotlyBuilder >> toImage: id settings: aDictionary [

	self 
		method: 'toImage';
		containerId: id;
		parameters: aDictionary;
		yourself
]
