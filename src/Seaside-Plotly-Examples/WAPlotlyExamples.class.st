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

{ #category : #'rendering-meta' }
WAPlotlyExamples >> examples [
	^ OrderedCollection
		streamContents: [ :s | 
			Pragma
				withPragmasIn: self class
				do: [ :pragma | s nextPut: pragma method selector ] ]
]

{ #category : #private }
WAPlotlyExamples >> randomColor [
	^ Color 
		h: 255 atRandom truncated 
		s: 20 
		v: 50
]

{ #category : #rendering }
WAPlotlyExamples >> renderContentOn: html [
	self renderHeaderOn: html.
	html div
		class: 'container';
		with: [ self renderExamplesOn: html ]
]

{ #category : #rendering }
WAPlotlyExamples >> renderExample: selector on: html [
	html div
		class: 'row';
		with: [ html div
				class: 'column-md-6';
				with: [ html div
						id: html nextId;
						with: [ "This is the container" ] ].
			html div
				class: 'column-md-6';
				with: [ self renderSourceOf: selector on: html ] ].
	html break.
	html tag: 'hr'.
	html document
		addLoadScript:
			(JSStream
				on:
					(html jQuery
						script: [ :script | self perform: selector with: script with: html lastId ]))
]

{ #category : #'rendering-meta' }
WAPlotlyExamples >> renderExamplesOn: html [
	self examples
		do: [ :selector | self renderExample: selector on: html ]
]

{ #category : #rendering }
WAPlotlyExamples >> renderHeaderOn: html [
	html div
		class: 'jumbotron';
		with: [ html div
				class: 'container';
				with: [ html heading
						class: 'display-4';
						with: [ html text: 'Plotly.js'.
							html space.
							html small: 'for Seaside!' ].
					html paragraph
						class: 'lead';
						with: [ html
								html:
									'Built on top of d3.js and stack.gl, <a href="https://plotly.com/javascript/">Plotly.js</a> is a high-level and <a href="https://github.com/plotly/plotly.js">open source</a>, declarative charting library, with over 40 chart types, including 3D charts, statistical graphs, finalcial charts, SVG maps and more!' ].
					html image
						url:
							'https://raw.githubusercontent.com/cldougl/plot_images/add_r_img/plotly_2017.png' ] ]
]

{ #category : #'rendering-meta' }
WAPlotlyExamples >> renderSourceOf: selector on: html [
	| sourceCode |
	sourceCode := self sourceCodeOf: selector.
	html div
		class: 'card';
		style: 'width: 100%';
		with: [ html div
				class: 'card-header';
				with: 'Source code'.
			html div
				class: 'card-body';
				with: [ html textArea
						style: 'height: auto';
						columns: 60;
						rows: sourceCode lines size;
						with: sourceCode ] ]
]

{ #category : #'sample traces' }
WAPlotlyExamples >> sampleContourTrace [
	| trace xValues yValues zValues |
	trace := PlotlyTrace contour
		name: 'Contour';
		showlegend: false;
		yourself.
	xValues := Array new: 100.
	yValues := Array new: 100.
	zValues := Array new: 100.
	xValues
		withIndexDo: [ :e :i | 
			| val |
			val := -2 * Float pi + (4 * Float pi * (i - 1) / 100).
			xValues at: i put: val.
			yValues at: i put: val.
			zValues at: i put: (Array new: 100) ].
	xValues
		withIndexDo: [ :x :i | 
			yValues
				withIndexDo: [ :y :j | 
					| r2 z |
					r2 := x * x + (y * y).
					"Math.sin(x[i]) * Math.cos(y[j]) * Math.sin(r2) / Math.log(r2+1)."
					z := [ x sin * y cos * r2 sin / (r2 + 1) ln ]
						on: ZeroDivide
						do: [ :ex | ex return: 0 ].
					(zValues at: i) at: j put: z ] ].
	trace
		x: xValues;
		y: yValues;
		z: zValues.
	^ trace
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExampleBoxOn: script elementId: elementId [
	<example>
	
	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{(PlotlyTrace box
				name: 'Box 1';
				showlegend: true;
				y: ((1 to: 100) collect: [ :each | 100 atRandom / 2 ]);
				yourself).
			(PlotlyTrace box
				name: 'Box 2';
				showlegend: true;
				y: ((1 to: 50) collect: [ :each | 100 atRandom / 3 ]);
				yourself)};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Box plot');
				width: 500 height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExampleBubbleOn: script elementId: elementId [
	<example>
	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{(PlotlyTrace bubble
				name: 'Line series';
				showlegend: true;
				x: (1 to: 5) asArray;
				y: ((1 to: 5) collect: [ :e | e squared ]);
				mode: 'markers';
				marker:
					(PlotlyMarker new
						color: ((1 to: 5) collect: [ :e | self randomColor asHTMLColor ]);
						opacity: ((1 to: 5) collect: [ :e | (0.5 to: 1 by: 0.1) atRandom ]);
						size: ((1 to: 5) collect: [ :e | e squared * 3 ]);
						yourself);
				yourself)};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Bubble plot');
				width: 500 height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExampleContourOn: script elementId: elementId [
	<example>
	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{self sampleContourTrace};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Contour plot');
				width: 500 height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExampleDonutOn: script elementId: elementId [
	<example>
	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{(PlotlyTrace pie
				values: #(19 , 26 , 55);
				hole: 0.4;
				labels: #('Residential' , 'Non-Residential' , 'Utility'))};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Donut Chart');
				width: 500 height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExampleHistogramOn: script elementId: elementId [
	<example>

	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{(PlotlyTrace histogram
				name: 'H1';
				showlegend: true;
				x: ((1 to: 100) collect: [ :each | 100 atRandom ]);
				yourself).
			(PlotlyTrace histogram
				name: 'H2';
				showlegend: true;
				x: ((1 to: 100) collect: [ :each | 100 atRandom ]);
				yourself)};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Histogram');
				width: 500 height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExamplePieInstantationOn: script elementId: elementId [
	<example>
	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{(PlotlyTrace pie
				values: #(19 , 26 , 55);
				labels: #('Residential' , 'Non-Residential' , 'Utility'))};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Pie Chart');
				width: 500;
				height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #'javascript-examples' }
WAPlotlyExamples >> scriptExampleScatterOn: script elementId: elementId [
	<example>
	| plotly |
	plotly := script plotly: elementId.
	plotly
		data:
			{(PlotlyTrace scatter
				name: 'Scatter series';
				showlegend: true;
				mode: 'markers';
				x: (1 to: 10) asArray;
				y: ((1 to: 10) collect: [ :each | 10 atRandom / 2 ]);
				yourself).
			(PlotlyTrace scatter
				name: 'Line series';
				showlegend: true;
				x: (1 to: 10) asArray;
				y: ((1 to: 10) collect: [ :each | 10 atRandom / 2 ]);
				yourself)};
		layout:
			(PlotlyLayout new
				title: (PlotlyText text: 'Simple plot');
				width: 500 height: 300;
				yourself).
	plotly config beResponsive.
	script << plotly
]

{ #category : #private }
WAPlotlyExamples >> sourceCodeOf: selector [
	| sourceSelector |
	sourceSelector := #(#sourceCode #sourceString)
		detect: [ :symbol | CompiledMethod canUnderstand: symbol ].
	^ ((self class compiledMethodAt: selector) perform: sourceSelector)
		copyReplaceAll: Character tab asString
		with: '  '
]

{ #category : #rendering }
WAPlotlyExamples >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	self updateRootStyling: anHtmlRoot.
	anHtmlRoot javascript
		url: 'https://cdn.plot.ly/plotly-2.4.2.min.js'.
	anHtmlRoot title: 'Plotly.js for Seaside'
]

{ #category : #rendering }
WAPlotlyExamples >> updateRootStyling: anHtmlRoot [

	anHtmlRoot meta 
		name: 'viewport';
		content: 'width=device-width, initial-scale=1, shrink-to-fit=no'.

	anHtmlRoot stylesheet
		url:
			'https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css';
		attributeAt: 'integrity'
			put:
			'sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot javascript
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js';
		attributeAt: 'integrity'
			put:
			'sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot javascript
		url:
			'https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js';
		attributeAt: 'integrity'
			put:
			'sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy';
		attributeAt: 'crossorigin' put: 'anonymous'
]
