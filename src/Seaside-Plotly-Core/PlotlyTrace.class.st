Class {
	#name : #PlotlyTrace,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Traces'
}

{ #category : #'checkbox-brick-accessing' }
PlotlyTrace class >> box [ 

	^self new 
		type: 'box';
		yourself
]

{ #category : #'instance creation' }
PlotlyTrace class >> bubble [
	^ self new
		type: 'bubble';
		yourself
]

{ #category : #'checkbox-brick-accessing' }
PlotlyTrace class >> histogram [ 

	^self new 
		type: 'histogram';
		yourself
]

{ #category : #'checkbox-brick-accessing' }
PlotlyTrace class >> pie [

	^self new 
		type: 'pie';
		yourself
]

{ #category : #'checkbox-brick-accessing' }
PlotlyTrace class >> scatter [ 

	^self new 
		type: 'scatter';
		yourself
]

{ #category : #configuring }
PlotlyTrace >> marker: aPlotlyMarker [

	self propertyAt: 'marker' put: aPlotlyMarker
]

{ #category : #configuring }
PlotlyTrace >> showlegend: aBoolean [

	self propertyAt: 'showlegend' put: aBoolean
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
