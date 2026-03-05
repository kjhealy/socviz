# prefix_replace

Replace series of characters (usually variable names) at the beginning
of a character vector.

## Usage

``` r
prefix_replace(var_names, prefixes, replacements, toTitle = TRUE, ...)
```

## Arguments

- var_names:

  A character vector, usually variable names

- prefixes:

  A character vector, usually variable prefixes

- replacements:

  A character vector of replacements for the \`prefixes\`, in the same
  order as them.

- toTitle:

  Convert results to Title Case? Defaults to TRUE.

- ...:

  Other arguments to \`gsub\`

## Value

A character vector with \`prefixes\` terms in \`var_names\` replaced
with the content of the \`replacement\` terms.

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
prefix_replace(iris$Species, c("set", "ver", "vir"), c("sat",
    "ber", "bar"))
#>   [1] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>   [6] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [11] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [16] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [21] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [26] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [31] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [36] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [41] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [46] "Satosa"     "Satosa"     "Satosa"     "Satosa"     "Satosa"    
#>  [51] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [56] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [61] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [66] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [71] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [76] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [81] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [86] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [91] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#>  [96] "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor" "Bersicolor"
#> [101] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [106] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [111] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [116] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [121] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [126] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [131] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [136] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [141] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
#> [146] "Barginica"  "Barginica"  "Barginica"  "Barginica"  "Barginica" 
```
