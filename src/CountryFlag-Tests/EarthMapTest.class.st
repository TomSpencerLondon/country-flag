Class {
	#name : 'EarthMapTest',
	#superclass : 'TestCase',
	#category : 'CountryFlag-Tests',
	#package : 'CountryFlag-Tests'
}

{ #category : 'tests' }
EarthMapTest >> testEarthMapCanAddCountry [
	| map country |
	map := EarthMap new.
	country := EarthMapCountry new name: 'France'; code: 'FR'.
	map addCountry: country.
	self assert: map countries size equals: 1.
]

{ #category : 'tests' }
EarthMapTest >> testEarthMapImportCountryFromXMLNode [
    | map xml element |
    map := EarthMap new.
    xml := '<path id="FR" title="France" d="M 0 0"/>'.
    element := (XMLDOMParser parse: xml) root.
    map importCountryFromXMLNode: element.
    self assert: map countries size equals: 1.
    self assert: map countries first name equals: 'France'.
]

{ #category : 'tests' }
EarthMapTest >> testEarthMapImportFromFile [
    | map |
    map := EarthMap new.
    map importCountriesFrom: '/Users/tomspencer/Desktop/katas/pharo/CountryFlag/world.svg'.
    self deny: map countries isEmpty.
]

{ #category : 'tests' }
EarthMapTest >> testEarthMapInitializesEmpty [
	| map |
	map := EarthMap new.
	self assert: map countries isEmpty.
]

{ #category : 'tests' }
EarthMapTest >> testEarthMapPopulatedCanvas [
    | map country canvas |
    map := EarthMap new.
    country := EarthMapCountry new svgPath: 'M 0 0 L 10 10'.
    map addCountry: country.
    canvas := map populatedCanvas.
    self assert: (canvas isKindOf: RSCanvas).
    self assert: canvas shapes size equals: 1.
]
