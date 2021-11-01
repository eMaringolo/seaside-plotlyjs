Extension { #name : #WARenderer }

{ #category : #'*Seaside-Plotly-Core' }
WARenderer >> plotly [
	^ (PlotlyBuilder context: self context)
		rendererClass: self species;
		yourself
]

{ #category : #'*Seaside-Plotly-Core' }
WARenderer >> plotly: containerId [

	^(self plotly)
		containerId: containerId;
		yourself
]
