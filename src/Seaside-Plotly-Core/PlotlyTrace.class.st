Class {
	#name : #PlotlyTrace,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Traces'
}

{ #category : #convenience }
PlotlyTrace >> beScatter [

	self type: 'scatter'
]

{ #category : #configuring }
PlotlyTrace >> type: aString [

	self propertyAt: 'type' put: aString
]

{ #category : #data }
PlotlyTrace >> x: aCollection [

	self propertyAt: 'x' put: aCollection
]

{ #category : #data }
PlotlyTrace >> y: aCollection [

	self propertyAt: 'y' put: aCollection
]

{ #category : #data }
PlotlyTrace >> z: aCollection [

	self propertyAt: 'z' put: aCollection
]
