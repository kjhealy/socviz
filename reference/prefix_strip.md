# prefix_strip

Strip a series of characters from the beginning of a character vector.

## Usage

``` r
prefix_strip(var_string, prefixes, toTitle = TRUE, ...)
```

## Arguments

- var_string:

  A character vector, usually variable names

- prefixes:

  A character vector, usually variable prefixes

- toTitle:

  Convert results to Title Case? Defaults to TRUE.

- ...:

  Other arguments to \`gsub\`

## Value

A character vector with \`prefixes\` terms stripped from the beginning
of \`var_name\` terms.

## Details

Takes a character vector (usually vector of variable names from a
summarized or tidied model object), along with a vector of character
terms (usually the prefix of a dummy or categorical variable added by R
when creating model terms) and strips the latter away from the former.
Useful for quickly cleaning variable names for a plot.

## Author

Kieran Healy

## Examples

``` r
prefix_strip(iris$Species, c("set", "v"))
#>   [1] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>   [7] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [13] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [19] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [25] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [31] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [37] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [43] "Osa"       "Osa"       "Osa"       "Osa"       "Osa"       "Osa"      
#>  [49] "Osa"       "Osa"       "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [55] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [61] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [67] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [73] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [79] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [85] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [91] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor"
#>  [97] "Ersicolor" "Ersicolor" "Ersicolor" "Ersicolor" "Irginica"  "Irginica" 
#> [103] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [109] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [115] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [121] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [127] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [133] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [139] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
#> [145] "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica"  "Irginica" 
```
