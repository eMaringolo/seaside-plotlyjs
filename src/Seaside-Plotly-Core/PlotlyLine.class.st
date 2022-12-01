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
PlotlyLine >> color: aColor [

	"set the color of the line"

	self propertyAt: 'color' put: aColor
]

{ #category : #accessing }
PlotlyLine >> dash: aString [

	"aString can be: solid, dot, dash, longdash, dashdot, or longdashdot"

	self propertyAt: 'dash' put: aString
]

{ #category : #accessing }
PlotlyLine >> shape: aString [
	"aString can be: linear, spline, vhv, hvh, vhv, hv, vh"

  self propertyAt: 'shape' put: aString
]

{ #category : #accessing }
PlotlyLine >> smoothing: aNumber [

	"aNumber can be between 0 and 1.3. Is only used when the line shape is set to 'spline'"

	self propertyAt: 'smoothing' put: aNumber
]

{ #category : #accessing }
PlotlyLine >> width: aNumber [

	"The width of the line. aNumber can be greater than or equal to 0."

	self propertyAt: 'width' put: aNumber
]
