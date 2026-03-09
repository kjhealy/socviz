
<!-- README.md is generated from README.Rmd. Please edit that file -->

# socviz <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![R build
status](https://github.com/kjhealy/socviz/workflows/R-CMD-check/badge.svg)](https://github.com/kjhealy/socviz/actions)
<!-- badges: end -->

This is an R package of datasets, functions, and course materials to go
along with the second edition of the book *[Data Visualization: A
Practical Introduction](https://amzn.to/2vfAixM)* (Princeton University
Press, 2026).

<img src="https://socviz.co/assets/cover/dv-cover-2esample.png" width = "75%"/>

## What’s in this Package

The `socviz` package contains about thirty datasets and a number of
utility and convenience functions. Most of them are used in *[Data
Visualization: A Practical Introduction](https://amzn.to/2vfAixM)*
(`http://socviz.co`), and there are also a few others as well for
self-learners and students to practice their skills on.

## Installation

To install the package, you can follow the instructions in the Preface
to the book. Alternatively, first download and install R for
[MacOS](https://cran.r-project.org/bin/macosx/),
[Windows](https://cran.r-project.org/bin/windows/) or
[Linux](https://cran.r-project.org/bin/linux/), as appropriate. Then
download and install [RStudio](http://rstudio.com/download/). Launch
RStudio and then type the following code at the Console prompt (`>`),
hitting return at the end of each line:

``` r


my_packages <- c("tidyverse", "fs", "devtools", "sf")
install.packages(my_packages)

install.packages("socviz")
```

To install the development version of `socviz`, instead of
`install.packages("socviz")` do the following:

``` r

remotes::install_github("kjhealy/socviz")
```

Once everything has downloaded and been installed (which may take a
little while), load the `socviz` package:

``` r
library(socviz)
```

## More about the Datasets and Functions

The included datasets and functions are documented at
<http://kjhealy.github.io/socviz/reference/>.
