# %nin%

Convenience 'not-in' operator

## Usage

``` r
x %nin% y
```

## Arguments

- x:

  vector of items

- y:

  vector of all values

## Value

logical vecotor of items in x not in y

## Details

Complement of the built-in operator `%in%`. Returns the elements of `x`
that are not in `y`.

## Author

Kieran Healy

## Examples

``` r
fruit <- c("apples", "oranges", "banana")
"apples" %nin% fruit
#> [1] FALSE
"pears" %nin% fruit
#> [1] TRUE
```
