# CountryFlag - Pharo TDD Kata

A Country Flag Browser built in Pharo using Test-Driven Development. Displays country shapes from SVG and fetches flags from the web.

## Overview

This kata teaches:
- **TDD** (Test-Driven Development) in Pharo
- **Roassal** visualization (SVG paths)
- **XML parsing** (loading country data)
- **HTTP client** (fetching flags from flagcdn.com)
- **Spec UI** (building a browser application)

Based on the [CountryFlag tutorial](https://github.com/SquareBracketAssociates/booklet-CountryTutorial/) by Stéphane Ducasse.

## Prerequisites

- Pharo 13 image
- XMLParser (loaded via Metacello)
- `world.svg` file (contains country shapes)

## Setup

### 1. Load XMLParser

```smalltalk
Metacello new
    baseline: 'XMLParser';
    repository: 'github://pharo-contributions/XML-XMLParser/src';
    load.
```

### 2. Download world.svg

Get `world.svg` from the [tutorial repo](https://github.com/SquareBracketAssociates/booklet-CountryTutorial/) and save it to this directory.

## Classes

### EarthMapCountry
Represents a single country with:
- `name` - Country name (e.g., 'France')
- `code` - ISO code (e.g., 'FR')
- `svgPath` - SVG path data for the country shape

Methods:
- `fromXML:` - Create from XML element
- `asRSShape` - Convert to Roassal shape
- `printOn:` - Display name in inspector

### EarthMap
Container for all countries:
- `countries` - Collection of EarthMapCountry objects
- `importCountriesFrom:` - Load from world.svg file
- `populatedCanvas` - Create Roassal canvas with all country shapes

### EarthCountryBrowser (Spec UI)
Visual browser showing:
- Country dropdown list
- Country code display
- Country flag (fetched from flagcdn.com)

## TDD Progress

| Step | Feature | Status |
|------|---------|--------|
| 1 | EarthMapCountry basic properties | ✅ |
| 2 | printOn: method | ✅ |
| 3 | asRSShape (Roassal) | ⬜ |
| 4 | fromXML: parsing | ⬜ |
| 5-6 | EarthMap container | ⬜ |
| 7 | populatedCanvas | ⬜ |
| 8 | Import from file | ⬜ |
| 9 | Flag fetching | ⬜ |
| 10 | Spec UI | ⬜ |

## Running Tests

In Pharo:
1. Open Test Runner (Cmd+O, U)
2. Select `CountryFlag-Tests` package
3. Run all tests

## Files

```
CountryFlag/
├── README.md           # This file
├── TDD_PLAN.md         # Step-by-step TDD guide
├── CountryFlag.pdf     # Original tutorial PDF
└── world.svg           # Country shape data (download separately)
```

## Usage (when complete)

```smalltalk
"Open the country flag browser"
(EarthCountryBrowser on:
    (EarthMap new importCountriesFrom: 'world.svg'))
    open
```

## Resources

- [Original Tutorial PDF](CountryFlag.pdf)
- [Tutorial GitHub Repo](https://github.com/SquareBracketAssociates/booklet-CountryTutorial/)
- [Roassal Documentation](https://github.com/pharo-graphics/Roassal)
- [Spec2 Book](https://github.com/SquareBracketAssociates/BuildingApplicationWithSpec2/)
