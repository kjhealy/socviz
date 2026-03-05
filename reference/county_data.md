# Census Data on US Counties

Selected county data (including US and state-level observations on some
variables). Preserved for use with the first edition of the book only.

## Usage

``` r
county_data
```

## Format

A data frame with 3195 rows and 13 columns.

## Source

US Census Bureau, Centers for Disease Control

## Details

The variables are as follows:

- id. FIPS State and County code (character)

- name. State or County Name

- state. State abbreviation

- census_region. Census region

- pop_dens. Population density per square mile, 2014 estimate (seven
  categories).

- pct_black. Percent black population, 2014 estimate (seven category
  factor)

- pop_dens6. Population density per square mile, 2014 estimate (six
  categories)

- su_gun6. Firearm-related suicides per 100,000 population, 1999-2015.
  Factor variable cut into six categories. Note that the values in this
  variable contain an inaccurate bottom-quartile coding by construction.
  Do not present this variable as an accurate measure of the
  firearm-related suicide rate.
