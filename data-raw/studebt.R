## code to prepare `studebt` dataset goes here
library(tidyverse)
library(here)

df <- read_csv(
  here("data-raw", "raw", "studebt1ed.csv"),
  col_types = cols(
    Debt = col_character(),
    type = col_character(),
    pct = col_integer(),
    Debtrc = col_character()
  )
)

debt_levs <- c(
  "Under $5",
  "$5-$10",
  "$10-$25",
  "$25-$50",
  "$50-$75",
  "$75-$100",
  "$100-$200",
  "Over $200"
)

df <- df |>
  mutate(Debtrc = factor(Debtrc, levels = debt_levs, ordered = TRUE))

studebt <- df

usethis::use_data(studebt, overwrite = TRUE)
