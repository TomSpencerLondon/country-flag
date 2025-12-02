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

{ #category : 'adding' }
EarthMap >> importCountriesFrom: aFilePath [
    | document |
    document := self xmlTreeFromFile: aFilePath.
    document nodes first nodes do: [ :node |
        (node class = XMLElement)
            ifTrue: [ self importCountryFromXMLNode: node ] ]
]

{ #category : 'as yet unclassified' }
EarthMap >> importCountryFromXMLNode: aXMLElement [
    countries add: (EarthMapCountry new fromXML: aXMLElement)
]

{ #category : 'initialization' }
EarthMap >> initialize [
	super initialize.
	countries := OrderedCollection new.
]

{ #category : 'adding' }
EarthMap >> populatedCanvas [
    ^ RSCanvas new
        addAll: (countries collect: [ :country | country asRSShape ]);
        @ RSCanvasController;
        yourself
]

{ #category : 'as yet unclassified' }
EarthMap >> xmlTreeFromFile: aFileName [
    ^ aFileName asFileReference readStreamDo: [ :stream |
        (XMLDOMParser parse: stream) document ]
]
