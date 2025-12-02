Class {
	#name : 'EarthMapCountry',
	#superclass : 'Object',
	#instVars : [
		'code',
		'name',
		'svgPath'
	],
	#category : 'CountryFlag',
	#package : 'CountryFlag'
}

{ #category : 'accessing' }
EarthMapCountry >> asRSShape [
	^ RSSVGPath new svgPath: svgPath
]

{ #category : 'accessing' }
EarthMapCountry >> code [
	^ code.
]

{ #category : 'accessing' }
EarthMapCountry >> code: countryCode [
	code := countryCode
]

{ #category : 'accessing' }
EarthMapCountry >> name [
	^ name
]

{ #category : 'accessing' }
EarthMapCountry >> name: countryName [ 
	name := countryName
]

{ #category : 'accessing' }
EarthMapCountry >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' '.
	aStream nextPutAll: (name ifNil: [ 'unnamed' ])
]

{ #category : 'accessing' }
EarthMapCountry >> svgPath [
	^ svgPath
]

{ #category : 'accessing' }
EarthMapCountry >> svgPath: countrySvg [
	svgPath := countrySvg
]
