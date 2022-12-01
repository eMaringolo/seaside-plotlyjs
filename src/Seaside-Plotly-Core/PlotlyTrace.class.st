Class {
	#name : #PlotlyTrace,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Traces'
}

{ #category : #'instance creation' }
PlotlyTrace class >> bar [

	^self new 
		type: 'bar';
		yourself
]

{ #category : #'instance creation' }
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

{ #category : #'instance creation' }
PlotlyTrace class >> contour [
	^ self new
		type: 'contour';
		yourself
]

{ #category : #'instance creation' }
PlotlyTrace class >> histogram [ 

	^self new 
		type: 'histogram';
		yourself
]

{ #category : #'instance creation' }
PlotlyTrace class >> pie [

	^self new 
		type: 'pie';
		yourself
]

{ #category : #'instance creation' }
PlotlyTrace class >> scatter [ 

	^self new 
		type: 'scatter';
		yourself
]

{ #category : #configuring }
PlotlyTrace >> clipOnAxis: aBoolean [
	"Determines whether or not markers and text nodes are clipped about the subplot axes. To show markers and text nodes above axis lines and tick labels, make sure to set `xaxis.layer` and `yaxis.layer` to 'below traces'."

	self propertyAt: 'cliponaxis' put: aBoolean
]

{ #category : #convenience }
PlotlyTrace >> dontClipOnAxis [

	self clipOnAxis: false
]

{ #category : #configuring }
PlotlyTrace >> line [

	^ self propertyAt: 'line' ifAbsentPut: [ PlotlyLine new ]
]

{ #category : #configuring }
PlotlyTrace >> line: aPlotlyLine [

	self propertyAt: 'line' put: aPlotlyLine
]

{ #category : #convenience }
PlotlyTrace >> lineAndMarkersMode [

	self mode: 'lines+markers'
]

{ #category : #convenience }
PlotlyTrace >> lineOnlyMode [

	self mode: 'line'
]

{ #category : #configuring }
PlotlyTrace >> marker [

	^self propertyAt: 'marker' ifAbsentPut: [ PlotlyMarker new ]
]

{ #category : #configuring }
PlotlyTrace >> marker: aPlotlyMarker [

	self propertyAt: 'marker' put: aPlotlyMarker
]

{ #category : #convenience }
PlotlyTrace >> markersOnlyMode [

	self mode: 'markers'
]

{ #category : #configuring }
PlotlyTrace >> mode: aString [

	self propertyAt: 'mode' put: aString
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
