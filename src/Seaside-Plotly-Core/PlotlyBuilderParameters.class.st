Class {
	#name : #PlotlyBuilderParameters,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Builder'
}

{ #category : #accessing }
PlotlyBuilderParameters >> config [

	^self properties at: 'config' ifAbsentPut: [PlotlyConfig new]
]

{ #category : #accessing }
PlotlyBuilderParameters >> data [

	^self properties at: 'data' ifAbsentPut: [OrderedCollection new]
]

{ #category : #accessing }
PlotlyBuilderParameters >> frames [

	^self properties at: 'frames' ifAbsentPut: [OrderedCollection new]
]

{ #category : #accessing }
PlotlyBuilderParameters >> layout [

	^self properties at: 'layout' ifAbsentPut: [PlotlyLayout new]
]
