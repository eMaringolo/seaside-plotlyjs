Class {
	#name : #PlotlyLegend,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Objects'
}

{ #category : #specs }
PlotlyLegend class >> horizontal [
	^ self new beHorizontal
]

{ #category : #convenience }
PlotlyLegend >> beHorizontal [ 

	self orientation: 'h'
]

{ #category : #convenience }
PlotlyLegend >> beVertical [

	self orientation: 'v'
]
