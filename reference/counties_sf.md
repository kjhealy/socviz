# US County geometries and demographic data

US County map data layer with selected Census Bureau demographic
variables.

## Usage

``` r
counties_sf
```

## Format

\## \`counties_sf\` A simple features object 3,144 rows and 16 columns:

- fips:

  FIPS code.

- name:

  County name.

- area_sqmi:

  Area in square miles.

- white:

  N White population.

- black:

  N Black population.

- asian:

  N Asian population.

- nh_white:

  N Non-Hispanic White population.

- hispanic:

  N Hispanic population.

- pop:

  Total population.

- black_disc:

  Percent Black, discretized.

- hisp_disc:

  Percent Hispanic, discretized.

- nhwhite_disc:

  Percent Non-Hispanic White, discretized.

- asian_disc:

  Percent Asian, discretized.

- pop_dens:

  Population density per square mile.

- pop_dens_disc:

  Population density per square mile, discretized.

- su_gun6:

  Firearm-related suicides per 100,000 population, 1999-2015. Factor
  variable cut into six categories. Note that the values in this
  variable contain an inaccurate bottom-quartile coding by construction.
  Do not present this variable as an accurate measure of the
  firearm-related suicide rate.

- pop_dens6:

  Population density per square mile, discretized into six categories,
  2014 estimates.

- geometry:

  Geometry.

## Source

US Census Bureau.

## Details

A simple features object. Load the \`sf\` package before using. Alaska
and Hawaii have had their geometries scaled and shifted to the bottom
left of the map area. Alaska's Aleutian islands are not included. Except
where noted, population counts and other demographic information are
from the 2024 5-year ACS estimates.

## Author

Kieran Healy
