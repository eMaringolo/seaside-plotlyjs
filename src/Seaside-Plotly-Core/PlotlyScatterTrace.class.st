Class {
	#name : #PlotlyScatterTrace,
	#superclass : #Plotly2DTrace,
	#category : #'Seaside-Plotly-Core-Traces'
}

{ #category : #'initialize-release' }
PlotlyScatterTrace >> initialize [ 

	super initialize.
	self beScatter
]
