Class {
	#name : #PlotlyFont,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Styles'
}

{ #category : #'as yet unclassified' }
PlotlyFont class >> family: aString size: pixelSize [

	^self new 
		family: aString;
		size: pixelSize;
		yourself
]
