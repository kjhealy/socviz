# Monthly Births in the U.S., 1933-2015

Births by month, 1933-2015, with decomposition components.

## Usage

``` r
okboomer
```

## Format

\## \`okboomer\` A data frame with 996 rows and 11 columns:

- date:

  Date in date format

- year_fct:

  Year as ordered factor

- month_fct:

  Month as ordered factor

- n_days:

  N of days in this month

- births:

  Total births in this month

- total_pop:

  Population

- births_pct:

  Births as a proportion of total population

- births_pct_day:

  Average daily births per million population

- seasonal:

  Seasonal component from an STL decomposition of \`births_pct_day\`

- trend:

  Trend component from an STL decomposition of \`births_pct_day\`

- remainder:

  Remainder component from an STL decomposition of \`births_pct_day\`

## Source

U.S. Census Bureau.

## Details

Dataset originally constructed to reproduce a visualization exercise by
Aaron Penne.

## Author

Kieran Healy
