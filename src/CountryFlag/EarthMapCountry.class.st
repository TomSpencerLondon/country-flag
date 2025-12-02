Class {
	#name : 'EarthMapCountry',
	#superclass : 'SpPresenterWithModel',
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
EarthMapCountry >> fetchFlag [
	| request pngArray |
	request := ZnClient new.
	request get: 'https://flagcdn.com/w320/', code asLowercase, '.png'.
	request isSuccess ifTrue: [ 
		 pngArray := request response contents.
		 ^ ImageReadWriter formFromStream: (ReadStream on: pngArray) ].
	^ nil
]

{ #category : 'accessing' }
EarthMapCountry >> fromXML: aXMLElement [
	name := aXMLElement attributeAt: 'title'.
	code := aXMLElement attributeAt: 'id'.
	svgPath := aXMLElement attributeAt: 'd'.
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
