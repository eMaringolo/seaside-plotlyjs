Class {
	#name : #PlotlyText,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Objects'
}

{ #category : #'instance creation' }
PlotlyText class >> text: aString [
	^ self new
		text: aString;
		yourself
]

{ #category : #accessing }
PlotlyText >> font: aPlotlyFont [

	self propertyAt: 'font' put: aPlotlyFont
]

{ #category : #accessing }
PlotlyText >> text: aString [

	self propertyAt: 'text' put: aString
]
