# int_to_year

Convert an integer to a date.

## Usage

``` r
int_to_year(x, month = "06", day = "15")
```

## Arguments

- x:

  An integer or vector integers.

- month:

  The month to be added to the year. Months 1 to 9 should be given as
  character strings, i.e. "01", "02", etc, and not 1 or 2o, etc.

- day:

  The day to be added to the year. Days should be given as character
  strings, i.e., "01" or "02", etc, and not 1 or 2, etc.

## Value

A vector of dates where the input integer forms the year component. The
day and month components added will by default be the 15th of June, so
that tick marks will appear in the middle of the series on plots. For
input, only years 0:9999 are accepted.

## Author

Kieran Healy

## Examples

``` r
int_to_year(1960)
#> [1] "1960-06-15"
class(int_to_year(1960))
#> [1] "Date"
int_to_year(1960:1965)
#> [1] "1960-06-15" "1961-06-15" "1962-06-15" "1963-06-15" "1964-06-15"
#> [6] "1965-06-15"
int_to_year(1990, month = "01", day = "30")
#> [1] "1990-01-30"
```
