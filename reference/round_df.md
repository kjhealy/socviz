# round_df

Round numeric columns of a data frame or tibble

## Usage

``` r
round_df(data, dig = 2)
```

## Arguments

- data:

  A data frame or tibble

- dig:

  The number of digits to round to

## Value

An object of the same class as \`data\`, with the numeric columns
rounded off to \`dig\`

## Details

Takes a data frame or tibble as input, rounds the numeric columns to the
specified number of digits.

## Author

Kieran Healy

## Examples

``` r
head(round_df(iris, 0))
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1            5           4            1           0  setosa
#> 2            5           3            1           0  setosa
#> 3            5           3            1           0  setosa
#> 4            5           3            2           0  setosa
#> 5            5           4            1           0  setosa
#> 6            5           4            2           0  setosa
```
