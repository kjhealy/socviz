# US Presidential Election 2016, State-level results

State-level vote totals and shares for the 2016 US Presidential
election. The variables are as follows:

- state. State name.

- st. State abbreviation.

- fips. State FIPS code

- total_vote. Total votes cast.

- vote_margin. Winner's vote margin

- winner. Winning candidate.

- party. Winning party.

- pct_margin. Winner's percentage margin (proportion of total vote)

- r_points. Percentage point difference between Trump share and Clinton

- d_points. Percentage point difference between Clinton share and Trump

- pct_clinton. Clinton vote share (proportion)

- pct_trump. Trump vote share (proportion)

- pct_johnson. Johnson vote share (proportion)

- pct_other. Other vote share (proportion)

- clinton_vote. Clinton vote total

- trump_vote. Trump vote total

- johnson_vote. Johnson vote total

- other_vote. Other vote total

- ev_dem. Electoral votes for Clinton

- ev_rep. Electoral votes for Trump

- ev_oth. Electoral votes for Other

- census. Census region.

## Usage

``` r
election
```

## Format

A (tibble) data frame with 51 rows and 22 columns.

## Source

Vote data from Dave Leip, US Election Atlas, http://uselectionatlas.org.
