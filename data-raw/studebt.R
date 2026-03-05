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
) |>
  mutate(
    Debtrc = str_replace(Debtrc, "(\\d{1})$", "\\1k"),
    Debtrc = str_replace(Debtrc, "(\\d{1})-", "\\1k-")
  )

debt_levs <- unique(df$Debtrc)

df2 <- df |>
  mutate(Debtrc = factor(Debtrc, levels = debt_levs, ordered = TRUE))

studebt <- df2

usethis::use_data(studebt, overwrite = TRUE)
