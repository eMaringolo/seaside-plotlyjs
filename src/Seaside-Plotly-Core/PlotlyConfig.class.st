Class {
	#name : #PlotlyConfig,
	#superclass : #PlotlyObject,
	#category : #'Seaside-Plotly-Core-Builder'
}

{ #category : #convenience }
PlotlyConfig >> beResponsive [

	self propertyAt: 'responsive' put: true
]

{ #category : #convenience }
PlotlyConfig >> beStatic [

	self propertyAt: 'staticPlot' put: true
]

{ #category : #accessing }
PlotlyConfig >> buttonsToRemove [

	^self properties at: 'modeBarButtonsToRemove' ifAbsentPut: [OrderedCollection new]
]

{ #category : #'initialize-release' }
PlotlyConfig >> convertKey: key [
	^ key
]

{ #category : #convenience }
PlotlyConfig >> disableScrollZoom [

	self scrollZoom: false
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

{ #category : #convenience }
PlotlyConfig >> hideLogo [

	self propertyAt: 'displaylogo' put: false
]

{ #category : #convenience }
PlotlyConfig >> hideModebar [

	self propertyAt: 'displayModeBar' put: false
]

{ #category : #accessing }
PlotlyConfig >> locale: aString [

	self propertyAt: 'locale' put: aString
]

{ #category : #accessing }
PlotlyConfig >> removeCameraLastSaveButton [

	self buttonsToRemove add: 'resetCameraLastSave3d'
]

{ #category : #accessing }
PlotlyConfig >> scrollZoom: aBoolean [

	self propertyAt: 'scrollZoom' put: aBoolean
]
