# US Presidential Election vote shares

A dataset of US presidential elections from 1824 to 2024, with
information on the winner, runner up, and various measures of vote
share. The variables are as follows:

## Usage

``` r
elections_historic
```

## Format

A (tibble) data frame with 51 rows and 19 columns.

## Source

https://en.wikipedia.org/wiki/List_of_United_States_presidential_elections_by_popular_vote_margin.

## Details

- election. Number of the election counting from the first US
  presidential election. 1824 is the 10th election.

- year. Year.

- winner. Full name of winner.

- win_party. Party affiliation of winner.

- ec_votes. Electoral college votes for winner.

- ec_denom. Number of votes in the electoral college.

- ec_pct. Winner's share of electoral college vote. (A proportion. Range
  is 0 to 1.)

- popular_pct. Winner's share of popular vote. (A proportion. Range is 0
  to 1.)

- popular_margin. Winner's margin of the popular vote, expressed as a
  proportion. Can be positive or negative.

- votes. Total votes cast in the election.

- margin. Winner's vote margin in the popular vote.

- runner_up. Runner up candidate.

- ru_part. Party affiliation of runner up candidate.

- turnout_pct. Voter turnout as a proportion of eligible voters. (A
  proportion. Range is 0 to 1.)

- winner_lname Last name of winner.

- winner_label Winner's last name and election year.

- ru_lastname. Runner up's last name.

- ru_label. Runner up's last name and election year.

- two_term. Is this a two term presidency? (TRUE/FALSE.) Note that F.D.
  Roosevelt was elected four times.
