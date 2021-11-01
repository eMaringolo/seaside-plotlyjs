Class {
	#name : #PlotlyConfig,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core'
}

{ #category : #accessing }
PlotlyConfig >> beResponsive [

	self propertyAt: 'responsive' put: true
]

{ #category : #accessing }
PlotlyConfig >> buttonsToRemove [

	^self properties at: 'modeBarButtonsToRemove' ifAbsentPut: [OrderedCollection new]
]

{ #category : #accessing }
PlotlyConfig >> downloadOptions [

	^self properties at: 'toImageButtonOptions'
		ifAbsentPut: [PlotlyDownloadOptions new]
]

{ #category : #configuring }
PlotlyConfig >> edits: editOptions [

	editOptions isEmpty ifTrue: [^self].
"might check, if all edit options are true"
	self propertyAt: 'edits' put: editOptions;
		propertyAt: 'editable' put: true
]

{ #category : #accessing }
PlotlyConfig >> hideLogo [

	self propertyAt: 'displaylogo' put: false
]

{ #category : #configuring }
PlotlyConfig >> hideModebar [

	self propertyAt: #displayModeBar put: false
]

{ #category : #accessing }
PlotlyConfig >> locale: aString [

	self propertyAt: 'locale' put: aString
]

{ #category : #accessing }
PlotlyConfig >> removeCameraLastSaveButton [

	self buttonsToRemove add: 'resetCameraLastSave3d'
]
