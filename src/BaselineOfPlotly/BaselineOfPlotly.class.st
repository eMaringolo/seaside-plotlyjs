Class {
	#name : #BaselineOfPlotly,
	#superclass : #BaselineOf,
	#category : #BaselineOfPlotly
}

{ #category : #baselines }
BaselineOfPlotly >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "self seaside: spec."
			spec
				package: 'Seaside-Plotly-Core'
					with: [ spec requires: #('Seaside3') ];
				package: 'Seaside-Plotly-Examples'
					with: [ spec requires: #('Seaside-Plotly-Core') ].
			spec
				group: 'Core' with: #('Seaside-Plotly-Core');
				group: 'Examples' with: #('Seaside-Plotly-Examples');
				group: 'all' with: #('Core' 'Examples');
				group: 'default' with: #('all') ]
]

{ #category : #baselines }
BaselineOfPlotly >> seaside: spec [

	spec
			baseline: 'Seaside3'
        	with: [ 
				spec
					loads: #('default');
					repository: 'github://SeasideSt/Seaside:master/repository' ]
]
