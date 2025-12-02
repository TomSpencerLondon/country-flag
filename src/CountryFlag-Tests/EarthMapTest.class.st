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
EarthMapTest >> testEarthMapInitializesEmpty [
	| map |
	map := EarthMap new.
	self assert: map countries isEmpty.
]
