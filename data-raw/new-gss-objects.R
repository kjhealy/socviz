library(tidyverse)
library(gssr)
library(haven)
library(here)
data(gss_all)


## from the forcats package examples
convert_income <- function(x) {
  regex <- "(under )[$]([0-9]+).*$"
  x <- gsub(regex, "Gt $0", x)
  regex <- "^(?:Lt |)[$]([0-9]+).*$"
  is_range <- grepl(regex, x)
  num_income <- as.numeric(gsub(regex, "\\1", x[is_range]))
  num_income <- trunc(num_income / 5000) * 5000
  x[is_range] <- paste0("Gt $", num_income)
  x
}

convert_polviews <- function(x) {
  regex <- "Extrmly"
  x <- gsub(regex, "Extremely", x)
  regex <- "Slghtly"
  x <- gsub(regex, "Slightly", x)
  x
}

convert_agegrp <- function(x) {
  x <- gsub("\\(", "", x)
  x <- gsub("\\[", "", x)
  x <- gsub("\\]", "", x)
  x <- gsub(",", "-", x)
  x <- gsub("-89", "+", x)
  regex <- "^(.*$)"
  x <- gsub(regex, "Age \\1", x)
  x
}

cont_vars <- c("year", "id", "ballot", "age")

cat_vars <- c(
  "degree",
  "race",
  "sex",
  "region", ## This is the same as bigregion now
  "income16",
  "childs",
  "sibs",
  "relig",
  "marital",
  "padeg",
  "madeg",
  "partyid",
  "polviews",
  "happy",
  "partners",
  "grass",
  "zodiac"
)

wt_vars <- c("wtssall", "wtssps")

design_vars <- c("vpsu", "vstrat")

int_vars <- c("id", "ballot", "year", "age", "vpsu", "vstrat")

gss_lon_vars <- c(cont_vars, cat_vars, wt_vars, design_vars)

gss_sm_vars <- c(cont_vars, cat_vars, "pres12", wt_vars)


gss_lon <- gss_all |>
  select(all_of(gss_lon_vars)) |>
  mutate(
    across(everything(), zap_missing),
    across(all_of(wt_vars), as.numeric),
    across(all_of(int_vars), as.integer),
    across(all_of(cat_vars), as_factor),
    across(all_of(cat_vars), \(x) fct_relabel(x, tolower)),
    across(all_of(cat_vars), \(x) fct_relabel(x, tools::toTitleCase))
  )

gss_lon$income_rc <- fct_relabel(gss_lon$income16, convert_income)

gss_lon$polviews <- fct_relabel(gss_lon$polviews, convert_polviews)

gss_lon$agegrp <- cut(gss_lon$age, breaks = c(18, 35, 45, 55, 65, 89))

qrts <- quantile(as.numeric(gss_lon$age), na.rm = TRUE)
gss_lon$ageq <- cut(gss_lon$age, unique(qrts), include.lowest = TRUE)
gss_lon$ageq <- fct_relabel(gss_lon$ageq, convert_agegrp)

gss_lon$agegrp <- fct_relabel(gss_lon$agegrp, convert_agegrp)

gss_lon$siblings <- fct_other(
  factor(gss_lon$sibs),
  keep = as.character(c(0:5)),
  other_level = "6+"
)

gss_lon$kids <- fct_other(
  factor(gss_lon$childs),
  keep = as.character(c(0:3)),
  other_level = "4+"
)

gss_lon$religion <- fct_lump(gss_lon$relig, n = 5, other_level = "Other")

# Annoyingly the same now
gss_lon$bigregion <- gss_lon$region

gss_lon$partners_rc <- fct_recode(
  gss_lon$partners,
  `0` = "No Partners",
  `1` = "1 Partner",
  `2` = "2 Partners",
  `3` = "3 Partners",
  `4+` = "4 Partners",
  `4+` = "5-10 Partners",
  `4+` = "11+ Partners",
  NULL = "1 or More, (Unspecified)"
)

gss_lon$degree <- fct_recode(
  gss_lon$degree,
  "Less than High School" = "less than High School",
  "Associate / Jr College" = "Associate/Junior College"
)

gss_lon$padeg <- fct_recode(
  gss_lon$padeg,
  "Less than High School" = "less than High School",
  "Associate / Jr College" = "Associate/Junior College"
)

gss_lon$madeg <- fct_recode(
  gss_lon$madeg,
  "Less than High School" = "less than High School",
  "Associate / Jr College" = "Associate/Junior College"
)


vars_lon <- c(
  "year",
  "id",
  "ballot",
  "age",
  "degree",
  "race",
  "sex",
  "siblings",
  "kids",
  "bigregion",
  "income16",
  "religion",
  "marital",
  "padeg",
  "madeg",
  "partyid",
  "polviews",
  "happy",
  "partners_rc",
  "grass",
  "zodiac",
  wt_vars,
  "vpsu",
  "vstrat"
)

gss_lon <- gss_lon |>
  select(all_of(vars_lon))

usethis::use_data(gss_lon, overwrite = TRUE, compress = "xz")
