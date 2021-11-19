Class {
	#name : #PlotlyLine,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Styles'
}

{ #category : #'instance creation' }
PlotlyLine class >> spline [
	^ self new
		shape: 'spline';
		yourself
]

{ #category : #accessing }
PlotlyLine >> shape: aString [
	"aString can be: linear, spline, vhv, hvh, vhv, hv, vh"

  self propertyAt: 'shape' put: aString
]
