Class {
	#name : #PlotlyMargin,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Styles'
}

{ #category : #accessing }
PlotlyMargin class >> value: anInteger [
	^ self new
		value: anInteger;
		yourself
]

{ #category : #accessing }
PlotlyMargin >> bottom: anInteger [

	self propertyAt: 'b' put: anInteger
]

{ #category : #accessing }
PlotlyMargin >> left: anInteger [

	self propertyAt: 'l' put: anInteger
]

{ #category : #accessing }
PlotlyMargin >> pad: anInteger [

	self propertyAt: 'pad' put: anInteger
]

{ #category : #accessing }
PlotlyMargin >> right: anInteger [

	self propertyAt: 'r' put: anInteger
]

{ #category : #accessing }
PlotlyMargin >> top: anInteger [

	self propertyAt: 't' put: anInteger
]

{ #category : #accessing }
PlotlyMargin >> value: anInteger [

	self
		top: anInteger;
		left: anInteger;
		right: anInteger;
		bottom: anInteger
]
