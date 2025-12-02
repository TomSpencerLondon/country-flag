Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'CountryFlag',
	#package : 'CountryFlag'
}

{ #category : 'adding' }
EarthMap >> addCountry: aCountry [
	countries add: aCountry
]

{ #category : 'initialization' }
EarthMap >> countries [
	^ countries
]

{ #category : 'initialization' }
EarthMap >> initialize [
	super initialize.
	countries := OrderedCollection new.
]
