Class {
	#name : #PlotlyLayout,
	#superclass : #PlotlyLayoutObject,
	#category : #'Seaside-Plotly-Core-Objects'
}

{ #category : #axes }
PlotlyLayout >> margin [

	^self propertyAt: 'margin' ifAbsentPut: [PlotlyMargin new]
]

{ #category : #axes }
PlotlyLayout >> sceneAt: index [

	^self propertyAt: (self sceneIdentifier: index)
		ifAbsentPut: [PlotlyScene new]
]
