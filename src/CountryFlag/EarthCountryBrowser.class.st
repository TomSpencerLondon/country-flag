Class {
	#name : 'EarthCountryBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'countryList',
		'countryCode',
		'countryFlag',
		'model'
	],
	#category : 'CountryFlag',
	#package : 'CountryFlag'
}

{ #category : 'initialization' }
EarthCountryBrowser >> connectPresenters [
    countryList whenSelectedItemChangedDo: [ :item |
        item ifNotNil: [ self onCountrySelected: item ] ]
]

{ #category : 'initialization' }
EarthCountryBrowser >> defaultLayout [
    ^ SpBoxLayout newTopToBottom
        add: (SpBoxLayout newLeftToRight
            add: countryList expand: true;
            add: countryCode width: 50)
        height: 30;
        add: countryFlag expand: true;
        yourself
]

{ #category : 'initialization' }
EarthCountryBrowser >> initializePresenters [
    countryList := self newDropList.
    countryList display: [ :item | item name ].
    model ifNotNil: [ countryList items: self model countries ].

    countryCode := self newTextInput.
    countryCode editable: false.
    countryCode text: '--'.
    
    countryFlag := self newImage.
]

{ #category : 'initialization' }
EarthCountryBrowser >> initializeWindow: aWindowPresenter [
    aWindowPresenter
        title: 'Country Flag Browser';
        initialExtent: 400 @ 450.
]

{ #category : 'initialization' }
EarthCountryBrowser >> model [
	^ model
]

{ #category : 'initialization' }
EarthCountryBrowser >> model: anEarthMap [
    model := anEarthMap
]

{ #category : 'initialization' }
EarthCountryBrowser >> modelChanged [
	countryList items: self model countries
]

{ #category : 'initialization' }
EarthCountryBrowser >> onCountrySelected: aCountry [
    countryCode text: aCountry code.
    countryFlag image: aCountry fetchFlag.
]

{ #category : 'initialization' }
EarthCountryBrowser >> setModelBeforeInitialization: aModel [
    model := aModel
]
