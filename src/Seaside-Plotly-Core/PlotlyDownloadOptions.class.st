Class {
	#name : #PlotlyDownloadOptions,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core'
}

{ #category : #format }
PlotlyDownloadOptions >> bePNG [

	self format: 'png'
]

{ #category : #format }
PlotlyDownloadOptions >> beSVG [

	self format: 'svg'
]

{ #category : #sizing }
PlotlyDownloadOptions >> extent: aPoint [

	self width: aPoint x.
	self height: aPoint y
]

{ #category : #files }
PlotlyDownloadOptions >> filename [

	self propertyAt: 'filename' put: 'plot'
]

{ #category : #files }
PlotlyDownloadOptions >> filename: aString [

	self propertyAt: 'filename' put: aString
]

{ #category : #format }
PlotlyDownloadOptions >> format: aString [

	self propertyAt: 'format' put: aString
]

{ #category : #sizing }
PlotlyDownloadOptions >> height: anInteger [

	self propertyAt: 'height' put: anInteger
]

{ #category : #'initialize-release' }
PlotlyDownloadOptions >> initialize [

	super initialize.
	self bePNG.
	self propertyAt: 'filename' put: 'plot'.
	self propertyAt: 'height' put: 1280.
	self propertyAt: 'width' put: 720.
	self scale: 1
]

{ #category : #sizing }
PlotlyDownloadOptions >> scale: anInteger [

	self propertyAt: 'scale' put: anInteger
]

{ #category : #sizing }
PlotlyDownloadOptions >> width: anInteger [

	self propertyAt: 'width' put: anInteger
]
