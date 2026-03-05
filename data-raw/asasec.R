## code to prepare `asasec` dataset goes here

library(tidyverse)
library(here)

df <- read_csv(
  here("data-raw", "raw", "asasec1e.csv"),
  col_types = cols(
    Section = col_character(),
    Sname = col_character(),
    Beginning = col_integer(),
    Revenues = col_integer(),
    Expenses = col_integer(),
    Ending = col_integer(),
    Journal = col_character(),
    Year = col_integer(),
    Members = col_integer()
  )
) |>
  filter(Year == 2014)

asasec <- df


usethis::use_data(asasec, overwrite = TRUE, compress = "xz")
