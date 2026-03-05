# US Presidential Election 2024, State-level results

State-level vote totals and shares for the 2024 US Presidential
election.

## Usage

``` r
election24
```

## Format

\## \`election24\` A data frame with 51 rows and 20 columns:

- state:

  State name.

- st:

  State abbreviation.

- fips:

  State FIPS code (character).

- total_vote:

  Total votes case.

- vote_margin:

  Vote margin (Trump positive values; Harris negative.)

- winner:

  Winning candidate.

- party:

  Winning party.

- pct_margin:

  Winner's percentage margin (proportion of total vote)

- r_points:

  Percentage point difference between Trump vote percent and Harris vote
  percent

- d_points:

  Percentage point difference between Harris vote percent and Trump vote
  percent

- pct_harris:

  Harris vote share (proportion)

- pct_trump:

  Trump vote share (proportion)

- pct_other:

  Other vote share (proportion)

- harris_vote:

  Harris vote total

- trump_vote:

  Trump vote total

- other_vote:

  Other vote total

- ev_dem:

  Electoral votes for Harris

- ev_rep:

  Electoral votes for Trump

- ev_other:

  Electoral votes for Others

- census:

  Census region

## Source

Vote data from Wikipedia,
https://en.wikipedia.org/wiki/2024_United_States_presidential_election

## Author

Kieran Healy
