## code to prepare `elections_historic` dataset goes here
library(tidyverse)
library(rvest)
library(here)

#elections_firsted <- socviz::elections_historic
#write_csv(elections_firsted, here("data-raw", "raw", "elections_firsted_df.csv"))

elections_firsted_df <- read_csv(here(
  "data-raw",
  "raw",
  "elections_firsted_df.csv"
))


# elections_raw_url <- read_html("https://en.wikipedia.org/wiki/List_of_United_States_presidential_elections_by_popular_vote_margin")
# elections_raw_df <- elections_raw_url |>
#   # Get all the tables classed as `.wikitable` on the page
#   html_elements(".wikitable") |>
#   pluck(2) |>
#   html_table() |>
#   janitor::clean_names() |>
#   slice(-10:-1)

#write_csv(elections_raw_df, here("data-raw", "raw", "elections_raw_df.csv"))

elections_raw_df <- read_csv(here("data-raw", "raw", "elections_raw_df.csv"))

elections_new_tmp <- elections_raw_df |>
  rename(
    winner = winner_and_party,
    win_party = winner_and_party_2,
    ec_votes = electoral_college,
    ec_pct = electoral_college_2,
    popular_pct = popular_vote,
    popular_margin = popular_vote_2,
    votes = popular_vote_3,
    margin = popular_vote_4,
    runner_up = runner_up_and_party,
    ru_part = runner_up_and_party_2,
    turnout_pct = turnout_9,
    year = election
  ) |>
  rowid_to_column("election") |>
  relocate(election) |>
  mutate(election = election + 9) |>
  mutate(
    across(everything(), \(x) str_remove(x, "\\[.\\]")),
    across(everything(), \(x) str_remove_all(x, ",")),
    across(everything(), \(x) str_remove(x, "%")),
    across(everything(), \(x) str_replace(x, "−", "-"))
  ) |>
  mutate(
    year = as.integer(year),
    ec_pct = as.double(str_remove(ec_pct, "%")) / 100,
    popular_pct = as.double(popular_pct) / 100,
    popular_margin = as.double(popular_margin) / 100,
    margin = as.integer(margin),
    votes = as.integer(votes),
    turnout_pct = as.double(turnout_pct) / 100
  ) |>
  mutate(
    win_party = case_when(
      win_party == "D-R" ~ "D.-R.",
      .default = win_party
    )
  ) |>
  separate_wider_delim(
    ec_votes,
    delim = "/",
    names = c("ec_votes", "ec_denom")
  ) |>
  mutate(
    ec_votes = as.integer(ec_votes),
    ec_denom = as.integer(ec_denom)
  )


tx_1ed <- elections_firsted_df |>
  select(
    election,
    year,
    winner_lname,
    winner_label,
    ru_lname,
    ru_label,
    two_term
  ) |>
  mutate(year = as.integer(year), election = as.character(election))

tmp <- elections_new_tmp |>
  left_join(tx_1ed, by = join_by(election, year)) |>
  mutate(
    winner_lname = case_when(
      winner == "Joe Biden" ~ "Biden",
      winner == "Donald Trump" ~ "Trump",
      .default = winner_lname
    ),
    winner_label = case_when(
      winner == "Joe Biden" ~ "Biden 2020",
      winner == "Donald Trump" & year == 2024 ~ "Trump 2024",
      .default = winner_label
    ),
    ru_lname = case_when(
      winner == "Joe Biden" ~ "Trump",
      winner == "Donald Trump" & year == 2024 ~ "Harris",
      .default = ru_lname
    ),
    ru_label = case_when(
      winner == "Joe Biden" ~ "Trump 2020",
      winner == "Donald Trump" & year == 2024 ~ "Harris 2024",
      .default = ru_label
    ),
    two_term = case_when(
      winner == "Joe Biden" ~ FALSE,
      winner == "Donald Trump" ~ TRUE,
      .default = two_term
    )
  )

tmp |>
  print(n = Inf)

elections_historic <- tmp

usethis::use_data(elections_historic, overwrite = TRUE)
