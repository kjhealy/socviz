# Quickly make a two-way table of proportions (percentages)

Quickly make a two-way table of proportions (percentages)

## Usage

``` r
tw_tab(x, y, margin = NULL, digs = 1, dnn = NULL, ...)
```

## Arguments

- x:

  Row variable

- y:

  Column variable

- margin:

  See \`prop.table\`. Default is joint distribution (all cells sum to
  100), 1 for row margins (rows sum to 1), 2 for column margins (columns
  sum to 1)

- digs:

  Number of digits to round percentages to. Defaults to 1.

- dnn:

  See \`table\`. the names to be given to the dimensions in the result
  (the dimnames names). Defaults to NULL for none.

- ...:

  Other arguments to be passed to \`table\`.

## Value

A contingency table of percentage values.

## Details

A wrapper for \`table\` and \`prop.table\` with the margin labels set by
default to NULL and the cells rounded to percents at 1 decimal place.

## Author

Kieran Healy

## Examples

``` r
with(gss_sm, tw_tab(bigregion, religion, useNA = "ifany", digs = 1))
#>            y
#> x           Protestant Catholic Jewish None Other <NA>
#>   Northeast        5.5      5.7    0.9  3.9   1.0  0.0
#>   Midwest         11.3      6.0    0.1  5.5   1.2  0.2
#>   South           22.7      5.6    0.4  5.9   1.7  0.4
#>   West             8.3      5.4    0.3  6.3   1.7  0.0

with(gss_sm, tw_tab(bigregion, religion, margin = 2, useNA =
    "ifany", digs = 1))
#>            y
#> x           Protestant Catholic Jewish None Other <NA>
#>   Northeast       11.5     25.0   52.9 18.1  17.6  5.6
#>   Midwest         23.7     26.5    5.9 25.4  20.8 27.8
#>   South           47.4     24.7   21.6 27.5  31.4 61.1
#>   West            17.4     23.9   19.6 29.1  30.2  5.6
```
