## code to prepare `counties_sf` dataset goes here

library(tidyverse)
library(tidycensus)
library(sf)
library(here)

## Setup
options(tigris_use_cache = TRUE)

pop_names <- tribble(
  ~varname      , ~clean     ,
  "B01003_001"  , "pop"      ,
  "B01001B_001" , "black"    ,
  "B01001A_001" , "white"    ,
  "B01001H_001" , "nh_white" ,
  "B01001I_001" , "hispanic" ,
  "B01001D_001" , "asian"
)

clean_names <- function(variable, lookup) {
  vtbl <- lookup

  for (i in 1:nrow(vtbl)) {
    variable <- stringr::str_replace(variable, vtbl$varname[i], vtbl$clean[i])
  }

  variable
}


## Get the data
fips_pop <- get_acs(
  geography = "county",
  variables = pop_names$varname,
  cache_table = TRUE
) |>
  mutate(variable = clean_names(variable, lookup = pop_names)) |>
  select(-moe) |>
  pivot_wider(names_from = variable, values_from = estimate) |>
  rename(fips = GEOID, name = NAME) |>
  mutate(
    prop_pop = pop / sum(pop),
    prop_black = black / pop,
    prop_hisp = hispanic / pop,
    prop_white = white / pop,
    prop_nhwhite = nh_white / pop,
    prop_asian = asian / pop
  )

fips_map <- get_acs(
  geography = "county",
  variables = "B01001_001",
  geometry = TRUE,
  shift_geo = FALSE,
  cache_table = TRUE
) |>
  mutate(area_sqmi = as.numeric(units::set_units(st_area(geometry), "mi^2"))) |>
  select(GEOID, NAME, area_sqmi, geometry) |>
  rename(fips = GEOID, name = NAME)

pop_cat_breaks <- seq(0, 100, 10)
pop_cat_labels <- c("<10", as.character(seq(20, 90, 10)), "100")

black_cat_breaks <- c(-Inf, 2, 5, 10, 15, 25, 50, Inf)
black_cat_labels <- c("<2", "2-5", "5-10", "10-15", "15-25", "25-50", ">50")

hisp_cat_breaks <- c(-Inf, 2, 5, 10, 15, 25, 50, Inf)
hisp_cat_labels <- c("<2", "2-5", "5-10", "10-15", "15-25", "25-50", ">50")

nhwhite_cat_breaks <- c(-Inf, 25, 50, 60, 70, 80, 90, Inf)
nhwhite_cat_labels <- c(
  "<25",
  "25-50",
  "50-60",
  "60-70",
  "70-80",
  "80-90",
  ">90"
)

asian_cat_breaks <- c(-Inf, 1, 2, 5, 10, 15, 20, Inf)
asian_cat_labels <- c("<1", "1-2", "2-5", "5-10", "10-15", "15-20", ">20")


counties_sf <- fips_map |>
  left_join(fips_pop, by = c("fips", "name")) |>
  mutate(
    black_disc = cut(
      prop_black * 100,
      breaks = black_cat_breaks,
      labels = black_cat_labels,
      ordered_result = TRUE
    ),
    hisp_disc = cut(
      prop_hisp * 100,
      breaks = hisp_cat_breaks,
      labels = hisp_cat_labels,
      ordered_result = TRUE
    ),
    nhwhite_disc = cut(
      prop_nhwhite * 100,
      breaks = nhwhite_cat_breaks,
      labels = nhwhite_cat_labels,
      ordered_result = TRUE
    ),
    asian_disc = cut(
      prop_asian * 100,
      breaks = asian_cat_breaks,
      labels = asian_cat_labels,
      ordered_result = TRUE
    ),
    pop_dens = (pop / area_sqmi),
    pop_dens_disc = cut(
      pop_dens,
      breaks = c(0, 10, 50, 100, 500, 1000, 5000, Inf),
      labels = c(
        "0-10",
        "10-50",
        "50-100",
        "100-500",
        "500-1,000",
        "1,000-5,000",
        ">5,000"
      )
    )
  ) |>
  filter(!str_starts(fips, "72")) |>
  tigris::shift_geometry() |>
  st_crop(xmin = -2500000, xmax = 2258200, ymin = -1697746, ymax = 1565782) |>
  select(!starts_with("prop_")) |>
  st_as_sf()

st_crs(counties_sf) <- st_crs(5070)

## Gun suicides column from 1ed county_data df
su_df <- readRDS(here("data-raw", "raw", "county_data.rda")) |>
  as_tibble() |>
  select(id, su_gun6, pop_dens6) |>
  rename(fips = id)


counties_sf <- counties_sf |>
  left_join(su_df, by = "fips")

## Thin it.
counties_sf <- counties_sf |>
  rmapshaper::ms_simplify(keep = 0.1) |>
  select(
    fips,
    name,
    area_sqmi,
    white,
    black,
    asian,
    nh_white,
    hispanic,
    pop,
    black_disc,
    hisp_disc,
    nhwhite_disc,
    asian_disc,
    pop_dens,
    pop_dens_disc,
    su_gun6,
    pop_dens6
  )


usethis::use_data(counties_sf, overwrite = TRUE, compress = "xz")
