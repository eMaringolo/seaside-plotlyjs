Class {
	#name : #PlotlyAxis,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core'
}

{ #category : #accessing }
PlotlyAxis >> automargin: aBoolean [

	self propertyAt: 'automargin' put: aBoolean
]

{ #category : #options }
PlotlyAxis >> beFixedRange [

	self fixedRange: true
]

{ #category : #options }
PlotlyAxis >> fixedRange: aBoolean [ 
	
	self propertyAt: 'fixedrange' put: aBoolean
]

{ #category : #accessing }
PlotlyAxis >> showgrid: aBoolean [

	self propertyAt: 'showgrid' put: aBoolean
]

{ #category : #accessing }
PlotlyAxis >> tickDelta: aNumber [

	self propertyAt: 'dtick' put: aNumber
]

{ #category : #accessing }
PlotlyAxis >> tickSuffix: aString [

	self propertyAt: 'ticksuffix' put: aString
]

{ #category : #accessing }
PlotlyAxis >> ticks: position [

	self propertyAt: 'ticks' put: position
]

{ #category : #accessing }
PlotlyAxis >> ticksPosition: position [
	"Alias for 'ticks' property, position can be one of 'outside', 'inside'."

	self ticks: position
]

{ #category : #accessing }
PlotlyAxis >> zeroline: aBoolean [
	self propertyAt: 'zeroline' put: aBoolean
]
