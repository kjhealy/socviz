## code to prepare `farskilled` dataset goes here
library(tidyverse)
library(here)


dfinvolved <- fars_involved <- readxl::read_xlsx(here(
  "data-raw",
  "raw",
  "involved-CrashReport-query-2025-10-08-readable.xlsx"
)) |>
  select(-Total) |>
  filter_all(any_vars(!is.na(.))) |>
  fill(month) |>
  pivot_longer(cols = `2009`:`2023`, names_to = "year", values_to = "n") |>
  filter(day %nin% "Total") |>
  filter(month %nin% "Total")

farsinvolved <- dfinvolved

usethis::use_data(farsinvolved, overwrite = TRUE, compress = "xz")
