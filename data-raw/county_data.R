## code to prepare `county_data` dataset goes here
library(tidyverse)
library(socviz)
library(here)

df <- readRDS(here("data-raw", "raw", "county_data.rda"))


county_data <- df |>
  as_tibble() |>
  select(id:pop_dens, pct_black, su_gun6, pop_dens6)

usethis::use_data(county_data, overwrite = TRUE, compress = "xz")
