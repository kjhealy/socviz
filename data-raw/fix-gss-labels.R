library(tidyverse)
library(forcats)
load(here::here("data", "gss_sm.rda"))
load(here::here("data", "gss_lon.rda"))

gss_sm <- gss_sm |>
  mutate(across(everything(), \(x) {
    attr(x, "label") <- NULL
    x
  }))

gss_lon <- gss_lon |>
  mutate(across(everything(), \(x) {
    attr(x, "label") <- NULL
    x
  }))

save(
  gss_sm,
  file = here::here("data", "gss_sm.rda"),
  compress = "xz",
  version = 3
)
save(
  gss_lon,
  file = here::here("data", "gss_lon.rda"),
  compress = "xz",
  version = 3
)
