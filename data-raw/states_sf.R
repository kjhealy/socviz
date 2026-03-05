## code to prepare `states_sf` dataset goes here

library(tidyverse)
library(tidycensus)
library(sf)

tmp <- read_csv(
  here("data-raw", "raw", "state_fips_st_census.csv"),
  col_types = cols(
    fips = col_character(),
    st = col_character(),
    census = col_character()
  )
)

states_sf <- get_estimates(
  geography = "state",
  variables = "RNETMIG",
  vintage = 2024,
  geometry = TRUE,
  resolution = "20m"
) |>
  filter(GEOID != "72") |>
  tigris::shift_geometry() |>
  st_crop(xmin = -2500000, xmax = 2258200, ymin = -1697746, ymax = 1565782) |>
  rename(fips = GEOID, state = NAME) |>
  select(-c(variable:value)) |>
  left_join(tmp, by = join_by(fips)) |>
  select(fips, st, state, census, geometry) |>
  st_as_sf()

st_crs(states_sf) <- st_crs(5070)


states_sf
class(states_sf)

usethis::use_data(states_sf, overwrite = TRUE, compress = "xz")
