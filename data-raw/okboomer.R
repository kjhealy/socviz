## code to prepare `okboomer` dataset goes here
library(tidyverse)
library(here)

# write_csv(demog::okboomer, here("data-raw", "raw", "okboomer.csv"))

df <- read_csv(
  here("data-raw", "raw", "okboomer.csv"),
  col_types = cols(
    year = col_integer(),
    month = col_character(),
    n_days = col_integer(),
    births = col_integer(),
    total_pop = col_integer(),
    births_pct = col_double(),
    births_pct_day = col_double(),
    date = col_date(format = ""),
    seasonal = col_double(),
    trend = col_double(),
    remainder = col_double(),
    country = col_character()
  )
) |>
  filter(country == "United States") |>
  select(-country) |>
  mutate(
    date = date + 15,
    year_fct = factor(year, levels = unique(year), ordered = TRUE),
    month_fct = factor(
      month,
      levels = rev(c(1:12)),
      labels = rev(c(
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
      )),
      ordered = TRUE
    )
  ) |>
  select(-c(year, month)) |>
  select(date, year_fct, month_fct, everything())

okboomer <- df

usethis::use_data(okboomer, overwrite = TRUE, compress = "xz")
