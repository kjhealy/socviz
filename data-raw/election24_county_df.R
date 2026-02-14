## code to prepare `elections24_county_df` dataset goes here

## Original object created in kjhealy/us_election_2024_visbook project but superseded here because of annoying Alaska stuff
## kjhealy/us_election_2024_visbook has Alaska with _state house district_ boundaries, not county boundaries. Here
## we now use data from https://doi.org/10.7910/DVN/VOQCHQ

library(tidyverse)
library(here)


elections20_county_df <- read_csv(
  here("data-raw", "raw", "us_election_county_2020.csv"),
  col_types = cols(
    state_name = col_character(),
    county_fips = col_character(),
    county_name = col_character(),
    votes_gop = col_integer(),
    votes_dem = col_integer(),
    total_votes = col_integer(),
    diff = col_integer(),
    per_gop = col_double(),
    per_dem = col_double(),
    per_point_diff = col_double()
  )
) |>
  mutate(
    winner20 = ifelse(votes_gop > votes_dem, "Republican", "Democratic")
  )

## Something weird about within-county vote total reporting in some FIPS, requiring grouping and summing that shouldn't be necessary
tmp_df <- read_csv(
  here("data-raw", "raw", "countypres_2000-2024.csv"),
  col_types = cols(
    state = col_character(),
    county_name = col_character(),
    year = col_integer(),
    state_po = col_character(),
    county_fips = col_character(),
    office = col_character(),
    candidate = col_character(),
    party = col_character(),
    candidatevotes = col_integer(),
    totalvotes = col_integer(),
    version = col_character(),
    mode = col_character()
  )
) |>
  filter(year %in% c(2020, 2024)) |>
  mutate(county_fips = str_pad(county_fips, 5, pad = "0")) |>
  mutate(across(where(is.character), \(x) str_to_title(x))) |>
  mutate(state_po = str_to_upper(state_po)) |>
  select(year, state_po, county_fips, party, candidatevotes, totalvotes) |>
  group_by(year, state_po, county_fips, party) |>
  summarize(
    candidatevotes = sum(candidatevotes),
    party = first(party),
    totalvotes = first(totalvotes)
  ) |>
  rename(
    total_votes = totalvotes,
    st = state_po
  ) |>
  mutate(
    party = replace_values(
      party,
      "Democrat" ~ "Democratic"
    )
  )

# Just need the winner here to calc flipped later
tmp2020_df <- tmp_df |>
  filter(year == 2020) |>
  ungroup() |>
  pivot_wider(names_from = party, values_from = candidatevotes) |>
  select(county_fips, Democratic, Republican, total_votes) |>
  rename(
    votes_dem = Democratic,
    votes_gop = Republican
  ) |>
  mutate(
    winner20 = ifelse(votes_dem > votes_gop, "Democratic", "Republican")
  ) |>
  select(county_fips, winner20)

tmp2024_df <- tmp_df |>
  filter(year == 2024) |>
  ungroup() |>
  pivot_wider(names_from = party, values_from = candidatevotes) |>
  select(county_fips, Democratic, Republican, total_votes) |>
  rename(
    votes_dem = Democratic,
    votes_gop = Republican
  ) |>
  mutate(
    winner = ifelse(votes_dem > votes_gop, "Democratic", "Republican")
  )

## Add `st` identifier
st_df <- read_csv(here("data-raw", "raw", "state-names-and-fips.csv"))

tmp_out <- tmp2024_df |>
  left_join(tmp2020_df, by = "county_fips") |>
  mutate(
    flipped = case_when(
      winner == "Republican" & winner20 == "Democratic" ~ "Yes",
      winner == "Democratic" & winner20 == "Republican" ~ "Yes",
      .default = "No"
    )
  ) |>
  select(county_fips:winner, flipped) |>
  rename(fips = county_fips) |>
  mutate(state_fips = str_extract(fips, "^\\d{2}")) |>
  left_join(st_df, by = "state_fips") |>
  select(fips, st, votes_dem:flipped)


election24_county_df <- tmp_out


usethis::use_data(election24_county_df, overwrite = TRUE, compress = "xz")
