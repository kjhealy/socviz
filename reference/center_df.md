# center_df

Scale and/or center the numeric columns of a data frame or tibble

## Usage

``` r
center_df(data, sc = FALSE, cen = TRUE)
```

## Arguments

- data:

  A data frame or tibble

- sc:

  Scale the variables (default FALSE)

- cen:

  Center the variables on their means (default TRUE)

## Value

An object of the same class as \`data\`, with the numeric columns scaled
or centered as requested

## Details

Takes a data frame or tibble as input and scales and/or centers the
numeric columns. By default, centers but doesn't scale

## Author

Kieran Healy

## Examples

``` r
head(center_df(organdata))
#> # A tibble: 6 × 21
#>   country   year       donors[,1] pop[,1] pop_dens[,1] gdp[,1] gdp_lag[,1]
#>   <chr>     <date>          <dbl>   <dbl>        <dbl>   <dbl>       <dbl>
#> 1 Australia NA              NA    -22856.        -11.8  -6212.      -5984.
#> 2 Australia 1991-01-01      -4.39 -22637.        -11.8  -5815.      -5801.
#> 3 Australia 1992-01-01      -4.13 -22426.        -11.8  -5072.      -5404.
#> 4 Australia 1993-01-01      -3.97 -22254.        -11.8  -4103.      -4661.
#> 5 Australia 1994-01-01      -6.23 -22066.        -11.8  -3137.      -3692.
#> 6 Australia 1995-01-01      -6.30 -21849.        -11.8  -1907.      -2726.
#> # ℹ 14 more variables: health <dbl[,1]>, health_lag <dbl[,1]>,
#> #   pubhealth <dbl[,1]>, roads <dbl[,1]>, cerebvas <dbl[,1]>,
#> #   assault <dbl[,1]>, external <dbl[,1]>, txp_pop <dbl[,1]>, world <chr>,
#> #   opt <chr>, consent_law <chr>, consent_practice <chr>, consistent <chr>,
#> #   ccode <chr>
```
