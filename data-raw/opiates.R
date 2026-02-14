## code to prepare `opiates` dataset goes here
library(tidyverse)
library(here)


df1ed <- read_csv(
  here("data-raw", "raw", "opiates-1ed.csv"),
  col_types = cols(
    year = col_integer(),
    state = col_character(),
    fips = col_integer(), # yeah I know
    deaths = col_integer(),
    population = col_integer(),
    crude = col_double(),
    adjusted = col_double(),
    adjusted_se = col_double(),
    region = col_character(),
    abbr = col_character(),
    division_name = col_character()
  )
) |>
  mutate(
    region = factor(
      region,
      levels = c("Northeast", "Midwest", "West", "South"),
      ordered = TRUE
    )
  )

regions <- df1ed |>
  select(state, abbr, region, division_name) |>
  distinct() |>
  rename(
    st = abbr
  )


df <- readxl::read_xlsx(here(
  "data-raw",
  "raw",
  "opiates-1999-2020-data-only.xlsx"
)) |>
  janitor::clean_names() |>
  select(-year_code) |>
  rename(fips = state_code, crude = crude_rate, adjusted = age_adjusted_rate) |>
  mutate(
    across(where(is.character), \(x) ifelse(x == "NA", NA_character_, x))
  ) |>
  mutate(
    year = as.integer(year),
    deaths = as.integer(deaths),
    crude = round(as.double(crude), 1),
    adjusted = round(as.double(adjusted), 1)
  ) |>
  left_join(regions, by = "state") |>
  select(fips, st, state, everything()) |>
  select(-c(population, state))

opiates <- df

usethis::use_data(opiates, overwrite = TRUE, compress = "xz")
