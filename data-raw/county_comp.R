## code to prepare `county_comp` dataset goes here

library(tidyverse)
library(socviz)
library(sf)
library(here)

#saveRDS(socviz::county_comp, here("data-raw", "raw", "county_comp.rds"))

df <- readRDS(here("data-raw", "raw", "county_comp.rds"))

county_comp <- df |>
  rename(fips = geoid)

usethis::use_data(county_comp, overwrite = TRUE, compress = "xz")
