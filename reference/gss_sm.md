# General Social Survey data, 2016

A dataset containing an extract from the 2016 General Social Survey. See
http://gss.norc.org/Get-Documentation for full documentation of the
variables.

## Usage

``` r
gss_sm
```

## Format

A data frame with 2538 rows and 26 columns.

## Source

National Opinion Research Center, http://gss.norc.org.

## Details

- year. gss year for this respondent.

- id. respondent id number.

- ballot. ballot used for interview.

- age. age of respondent.

- childs. number of children.

- sibs. number of brothers and sisters.

- degree. Rs highest degree.

- race. race of respondent.

- sex. respondent's sex.

- region. region of interview.

- income16. total family income.

- relig. rs religious preference.

- marital. marital status.

- padeg. fathers highest degree.

- madeg. mothers highest degree.

- partyid. political party affiliation.

- polviews. think of self as liberal or conservative.

- happy. general happiness.

- partners. how many sex partners r had in last year.

- grass. should marijuana be made legal.

- zodiac. respondents astrological sign.

- pres12. raw variable for whether the Respondent voted for Obama.
  Recoded to obama in this dataset.

- wtssall. weight variable.

- income_rc. Recoded income variable.

- agegrp. Age variable recoded into age categories

- ageq. Age recoded into quartiles.

- siblings. Top-coded sibs variable.

- kids. Top-coded childs variable.

- bigregion. Region variable (Census divisions) recoded to four Census
  regions.

- religion. relig variable recoded to six categories.

- partners_rc. partners variable recoded to five categories.

- obama. Respondent says the voted for Obama in 2012. 1 = yes; 0 = all
  other non-design options (Romney, other candidate, did not vote,
  refused, etc.)
