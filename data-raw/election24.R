## code to prepare `election24` dataset goes here
library(tidyverse)
library(here)

df <- readxl::read_xlsx(here::here("data-raw", "raw", "election24.xlsx"))

df_other <- df |>
  select(state, contains(c("stein", "kennedy", "oliver", "other"))) |>
  pivot_longer(
    -state,
    names_to = c(".value", "candidate"),
    names_pattern = "(votes|pct|ev)_(.*)"
  ) |>
  group_by(state) |>
  summarize(
    votes_other = sum(votes),
    pct_other = sum(pct),
    ev_other = sum(ev)
  )

info_df <- read_csv(here(
  "data-raw",
  "raw",
  "us_state_election2016_firsted_df.csv"
)) |>
  select(state, st, fips, census) |>
  mutate(fips = str_pad(fips, 2, pad = "0"))


election24 <- df |>
  select(state:ev_dem, vote_margin:total_vote) |>
  left_join(df_other) |>
  left_join(info_df) |>
  mutate(
    winner = case_when(
      votes_trump > votes_harris ~ "Trump",
      votes_harris > votes_trump ~ "Harris",
      .default = NA
    ),
    party = ifelse(winner == "Trump", "Republican", "Democratic")
  ) |>
  rename(
    trump_vote = votes_trump,
    harris_vote = votes_harris,
    other_vote = votes_other
  ) |>
  mutate(r_points = pct_margin * 100, d_points = -pct_margin * 100) |>
  select(
    state,
    st,
    fips,
    total_vote,
    vote_margin,
    winner,
    party,
    pct_margin,
    r_points,
    d_points,
    pct_harris,
    pct_trump,
    pct_other,
    harris_vote,
    trump_vote,
    other_vote,
    ev_dem,
    ev_rep,
    ev_other,
    census
  )

usethis::use_data(election24, overwrite = TRUE)
