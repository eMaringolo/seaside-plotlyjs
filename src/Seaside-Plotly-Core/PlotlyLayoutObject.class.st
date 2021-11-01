Class {
	#name : #PlotlyLayoutObject,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core'
}

{ #category : #axes }
PlotlyLayoutObject >> axisAt: axisLetter [

	^self axisAt: axisLetter index: 0
]

{ #category : #axes }
PlotlyLayoutObject >> axisAt: axisLetter index: anInteger [

	| axisIdentifier axis |
	axisIdentifier := self axisIdentifier: axisLetter index: anInteger.
	axis := self propertyAt: axisIdentifier ifAbsentPut: [PlotlyAxis new].
	^axis
]

{ #category : #axes }
PlotlyLayoutObject >> axisAt: axisLetter index: anInteger put: aPlotlyAxis [

	| axisIdentifier |
	axisIdentifier := self axisIdentifier: axisLetter index: anInteger.
	^self propertyAt: axisIdentifier put: aPlotlyAxis
]

{ #category : #axes }
PlotlyLayoutObject >> axisAt: axisLetter put: aPlotlyAxis [

	self axisAt: axisLetter index: 0 put: aPlotlyAxis
]

{ #category : #axes }
PlotlyLayoutObject >> axisIdentifier: axisLetter index: anInteger [
	"Return an axis identifier using sequential indices for each axis, e.g.
		anInteger = 1 -> xaxis
		anInteger = 2 -> xaxis2, etc."

	^axisLetter asLowercase asString , 'axis'
		, (anInteger = 1 ifTrue: [''] ifFalse: [anInteger printString])
]

{ #category : #axes }
PlotlyLayoutObject >> sceneIdentifier: anInteger [
	"Return an scene identifier using sequential indices for each scene,
	e.g.
		anInteger = 1 -> scene
		anInteger = 2 -> scene2, etc."

	^anInteger = 1
		ifTrue: ['scene' asString]
		ifFalse: ['scene' , anInteger printString]
]
