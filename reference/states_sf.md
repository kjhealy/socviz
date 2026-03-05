# US State geometries

US State map data layer

## Usage

``` r
states_sf
```

## Format

\## \`states_sf\` A simple features object with 51 rows and 5 columns:

- fips:

  State FIPS code

- st:

  State name abbreviation

- state:

  State name

- census:

  Census region

- geometry:

  Geometry

## Source

US Census Bureau.

## Details

A simple features object. Load the \`sf\` package before using. Alaska
and Hawaii have had their geometries scaled and shifted to the bottom
left of the map area. Alaska's Aleutian islands are not included.

## Author

Kieran Healy
