Class {
	#name : 'EarthMapCountryTest',
	#superclass : 'TestCase',
	#category : 'CountryFlag-Tests',
	#package : 'CountryFlag-Tests'
}

{ #category : 'tests' }
EarthMapCountryTest >> testCountryAsRSShape [
	| country shape |
	country := EarthMapCountry new.
	country svgPath: 'M 0 0 L 10 10'.
	shape := country asRSShape.
	self assert: (shape isKindOf: RSSVGPath).
]

{ #category : 'tests' }
EarthMapCountryTest >> testCountryFromXML [
	| xml country element |
	xml := '<path id="FR" title="France" d="M 0 0 L 10 10"/>'.
	element := (XMLDOMParser parse: xml) root.
	country := EarthMapCountry new fromXML: element.
	self assert: country name equals: 'France'.
	self assert: country code equals: 'FR'.
	self assert: country svgPath equals: 'M 0 0 L 10 10'. 
]

{ #category : 'tests' }
EarthMapCountryTest >> testCountryHasCode [
	| country |
	country := EarthMapCountry new.
	country code: 'FR'.
	self assert: country code equals: 'FR'.
]

{ #category : 'tests' }
EarthMapCountryTest >> testCountryHasName [
	| country |
	country := EarthMapCountry new.
	country name: 'France'.
	self assert: country name equals: 'France'.
]

{ #category : 'tests' }
EarthMapCountryTest >> testCountryHasSvgPath [
	| country |
	country := EarthMapCountry new.
	country svgPath: 'M 0 0 L 10 10'.
	self assert: country svgPath equals: 'M 0 0 L 10 10'.
]

{ #category : 'tests' }
EarthMapCountryTest >> testCountryPrintOn [
	| country |
	country := EarthMapCountry new.
	country name: 'France'.
	self assert: (country printString includesSubstring: 'France').
]
