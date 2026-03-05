# Generate a tidy n-way frequency table

Generate a tidy n-way frequency table

## Usage

``` r
freq_tab(df, ...)
```

## Arguments

- df:

  tibble or data frame (implicit within pipline)

- ...:

  grouping, as with group_by()

## Value

A tibble with the grouping variables, the N (\`n\`) per group, and the
proportion (\`prop\`) of each group, calculated with respect to the
outermost grouping variable.

## Details

Tidyverse, pipeline, and dplyr-friendly frequency tables

## Author

Kieran Healy

## Examples

``` r
mtcars %>% freq_tab(vs, gear, carb)
#> # A tibble: 13 × 5
#> # Groups:   vs [2]
#>       vs  gear  carb     n   prop
#>    <dbl> <dbl> <dbl> <int>  <dbl>
#>  1     0     3     2     4 0.222 
#>  2     0     3     3     3 0.167 
#>  3     0     3     4     5 0.278 
#>  4     0     4     4     2 0.111 
#>  5     0     5     2     1 0.0556
#>  6     0     5     4     1 0.0556
#>  7     0     5     6     1 0.0556
#>  8     0     5     8     1 0.0556
#>  9     1     3     1     3 0.214 
#> 10     1     4     1     4 0.286 
#> 11     1     4     2     4 0.286 
#> 12     1     4     4     2 0.143 
#> 13     1     5     2     1 0.0714
```
