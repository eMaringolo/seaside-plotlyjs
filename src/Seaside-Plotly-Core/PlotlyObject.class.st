"
I provide a convenience way to define the JSON Schema representation of Plotly.js objects.

All the properties can be accesed through the `properties` instance variable, and some methods are defined at this level but the properties are only valid for certain subclasses (e.g. `title`), although they're harmless or ignored if used in the wrong abstraction.


"
Class {
	#name : #PlotlyObject,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'Seaside-Plotly-Core-Objects'
}

{ #category : #'error handling' }
PlotlyObject >> doesNotUnderstand: aMessage [
	| selector |
	selector := aMessage selector.
	(selector isUnary or: [ selector isKeyword ])
		ifTrue: [ selector numArgs = 0
				ifTrue: [ ^ self properties at: selector asLowercase ifAbsent: [ nil ] ].
			selector numArgs = 1
				ifTrue: [ self properties
						at: selector asGetter asLowercase
						put: aMessage arguments first.
					^ self ] ].
	super doesNotUnderstand: aMessage
]

{ #category : #accessing }
PlotlyObject >> font: aPlotlyFont [
	self properties at: 'font' put: aPlotlyFont
]

{ #category : #'initialize-release' }
PlotlyObject >> initialize [

	super initialize.
	properties := Dictionary new.
]

{ #category : #serializing }
PlotlyObject >> javascriptOn: aStream [

	JSStream encodeDictionary: self properties on: aStream
]

{ #category : #serializing }
PlotlyObject >> jsonOn: json [

	json render: self properties
]

{ #category : #'private-properties' }
PlotlyObject >> properties [
	^properties ifNil: [properties := Dictionary new]
]

{ #category : #'private-properties' }
PlotlyObject >> propertyAt: key ifAbsent: aBlock [
	^self properties at: key ifAbsent: aBlock
]

{ #category : #'private-properties' }
PlotlyObject >> propertyAt: key ifAbsentPut: aBlock [
	^self properties at: key ifAbsentPut: aBlock
]

{ #category : #'private-properties' }
PlotlyObject >> propertyAt: key put: anObject [
	self properties at: key put: anObject
]

{ #category : #accessing }
PlotlyObject >> title: aString [

	self propertyAt: 'title' put: aString
]
