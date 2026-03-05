## code to prepare `acs_poverty` dataset goes here

library(tidyverse)
library(socviz)
library(sf)
library(here)

#saveRDS(socviz::acs_poverty, here("data-raw", "raw", "acs_poverty.rds"))

df <- readRDS(here("data-raw", "raw", "acs_poverty.rds"))

acs_poverty <- df |>
  rename(fips = geoid)

usethis::use_data(acs_poverty, overwrite = TRUE, compress = "xz")
