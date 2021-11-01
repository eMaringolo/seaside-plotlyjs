Extension { #name : #JSScript }

{ #category : #'*Seaside-Plotly-Core' }
JSScript >> plotly [
	^ (PlotlyBuilder context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #'*Seaside-Plotly-Core' }
JSScript >> plotly: containerId [

	^(self plotly)
		containerId: containerId;
		yourself
]
