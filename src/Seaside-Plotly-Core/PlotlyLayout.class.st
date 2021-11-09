Class {
	#name : #PlotlyLayout,
	#superclass : #PlotlyLayoutObject,
	#category : #'Seaside-Plotly-Core-Objects'
}

{ #category : #sizing }
PlotlyLayout >> fitWidth: widthPx height: heightPx [
	self
		width:
			(JSStream
				on:
					('Math.min(window.innerWidth, Math.min(<1p>, <2p>))'
						expandMacrosWith: widthPx
						with: heightPx))
		height:
			(JSStream
				on:
					('Math.min(window.innerWidth, Math.min(<1p>, <2p>))'
						expandMacrosWith: widthPx
						with: heightPx))
]

{ #category : #axes }
PlotlyLayout >> legend [

	^self propertyAt: 'legend' ifAbsentPut: [PlotlyLegend new]
]

{ #category : #axes }
PlotlyLayout >> margin [

	^self propertyAt: 'margin' ifAbsentPut: [PlotlyMargin new]
]

{ #category : #sizing }
PlotlyLayout >> maxWidth: widthPx height: heightPx [
	self
		width:
			(JSStream
				on: ('Math.min(window.innerWidth, <1p>)' expandMacrosWith: widthPx))
		height: heightPx
]

{ #category : #axes }
PlotlyLayout >> sceneAt: index [

	^self propertyAt: (self sceneIdentifier: index)
		ifAbsentPut: [PlotlyScene new]
]

{ #category : #sizing }
PlotlyLayout >> width: anInteger height: anInteger2 [
	self width: anInteger.
	self height: anInteger2
]
