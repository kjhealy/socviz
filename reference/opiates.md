# Opiate-Related Deaths in the United States, 1999-2020

State-level data on opiate related deaths in the US, from the CDC WONDER
database.

## Usage

``` r
opiates
```

## Format

\## \`opiates\` A tibble frame with 1,122 rows and 8 columns:

- fips:

  State FIPS code.

- st:

  State abbreviation.

- year:

  Year.

- deaths:

  N opiate-related deaths.

- crude:

  Crude death rate per 100,000 population.

- adjusted:

  Adjusted death rate.

- region:

  Census region.

- division_name:

  Census division.

## Source

CDC WONDER, http://wonder.cdc.gov/mcd-icd10.html

## Details

Dataset is Multiple Cause of Death, 1999-2020. Standard Population: 2000
U.S. Std. Population. Rates per 100,000. Default intercensal populations
for years 2001-2009. MCD ICD-10 Codes selected: T40.0 (Opium), T40.1
(Heroin), T40.2 (Other opioids), T40.3 (Methadone), T40.4 (Other
synthetic narcotics), T40.6 (Other and unspecified narcotics). UCD
ICD-10 Codes selected: X40-X44, X60-X64, X85, Y10-Y14.

## Author

Kieran Healy
