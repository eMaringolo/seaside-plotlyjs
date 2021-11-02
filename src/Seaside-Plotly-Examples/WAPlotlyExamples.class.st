Class {
	#name : #WAPlotlyExamples,
	#superclass : #WAComponent,
	#category : #'Seaside-Plotly-Examples'
}

{ #category : #'class initialization' }
WAPlotlyExamples class >> initialize [ 

	super initialize.
	WAAdmin register: self asApplicationAt: 'plotly'
]

{ #category : #rendering }
WAPlotlyExamples >> renderBasicExampleOn: html [
	html heading with: 'Simple example'.
	html div
		id: 'plot-01';
		with: [  ].
	html document
		addLoadScript:
			(html jQuery
				script: [ :script | self scriptExampleOneInstantationOn: script ]) asJSStream
]

{ #category : #rendering }
WAPlotlyExamples >> renderContentOn: html [
	self renderBasicExampleOn: html
]

{ #category : #rendering }
WAPlotlyExamples >> scriptExampleOneInstantationOn: script [
	| plotly |
	plotly := script plotly: 'plot-01'.
	plotly
		data:
			{(PlotlyTrace new
				name: 'Simple scatter';
				x: (1 to: 10);
				y: ((1 to: 10) collect: [ :each | 10 atRandom / 2 ]);
				yourself)};
		layout: PlotlyLayout new.
	plotly config
		hideLogo;
		beResponsive;
		hideModebar.
	plotly config downloadOptions filename: 'seaside-plotly'.
	script << plotly
]

{ #category : #rendering }
WAPlotlyExamples >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript url: 'https://pagecdn.io/lib/plotly-js/2.4.2/plotly.min.js'
]
