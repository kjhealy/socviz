#' General Social Survey data, 2014
#'
#' A dataset containing an extract from the 2014 General Social
#' Survey. See http://gss.norc.org/Get-Documentation for full
#' documentation of the variables.
#'
#' \itemize{
#' \item year. gss year for this respondent.
#' \item id. respondent id number.
#' \item ballot. ballot used for interview.
#' \item age. age of respondent.
#' \item childs. number of children.
#' \item sibs. number of brothers and sisters.
#' \item degree. Rs highest degree.
#' \item race. race of respondent.
#' \item sex. respondent's sex.
#' \item region. region of interview.
#' \item income16. total family income.
#' \item relig. rs religious preference.
#' \item marital. marital status.
#' \item padeg. fathers highest degree.
#' \item madeg. mothers highest degree.
#' \item partyid. political party affiliation.
#' \item polviews. think of self as liberal or conservative.
#' \item happy. general happiness.
#' \item partners. how many sex partners r had in last year.
#' \item grass. should marijuana be made legal.
#' \item zodiac. respondents astrological sign.
#' \item wtssall. weight variable.
#' \item income_rc. Recoded income variable.
#' \item agegrp. Age variable recoded into age categories
#' \item ageq. Age recoded into quartiles.
#' \item siblings. Top-coded sibs variable.
#' \item kids. Top-coded childs variable.
#' \item bigregion. Region variable (Census divisions) recoded to four Census regions.
#' \item religion. relig variable recoded to six categories.
#' \item partners_rc. partners variable recoded to five categories.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name gss_sm
#' @usage data(gss_sm)
#' @format A data frame with 2538 rows and 24 variables.
#' @source National Opinion Research Center, http://gss.norc.org.
"gss_sm"

#' US Presidential Election vote shares
#'
#' A dataset of US presidential elections from 1824 to 2016, with
#'  information on the winner, runner up, and various measures of vote
#'  share. Data for 2016 are provisional as of early December 2016.
#'  The variables are as follows:
#'
#' \itemize{
#' \item election. Number of the election counting from the first US
#' presidential election. 1824 is the 10th election.
#' \item year. Year.
#' \item winner. Full name of winner.
#' \item win.party. Party affiliation of winner.
#' \item ec.pect. Winner's share of electoral college vote.
#' (Range is 0 to 1.)
#' \item popular.pct. Winner's share of popular vote. (Range is 0 to 1.)
#' \item popular.margin. Winner's point margin in the popular vote.
#' Can be positive or negative.
#' \item votes. Total votes cast in the election.
#' \item margin. Winner's vote margin in the popular vote.
#' \item runner.up. Runner up candidate.
#' \item ru.part. Party affiliation of runner up candidate.
#' \item turnout.pct. Voter turnout as a proportion of eligible
#' voters. (Rate is 0 to 1.)
#' \item winner.lname Last name of winner.
#' \item winner.label Winner's last name and election year.
#' \item ru.lastname. Runner up's last name.
#' \item ru.label. Runner up's last name and election year.
#' \item two.term. Is this a two term presidency? (TRUE/FALSE.) Note
#' that F.D. Roosevelt was elected four times.
#' \item ec.votes. Electoral college votes cast for winner.
#' \item ec.denom. Total number of electoral college votes.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name elections_historic
#' @usage data(elections_historic)
#' @format A (tibble) data frame with 237 rows and 21 variables.
#' @source https://en.wikipedia.org/wiki/List_of_United_States_presidential_elections_by_popular_vote_margin.
"elections_historic"

#' Organ donation in the OECD
#'
#' A dataset containing data on rates of organ donation for seventeen OECD
#'  countries between 1991 and 2002. The variables are as follows:
#'
#' \itemize{
#' \item country. Country name.
#' \item year. Year.
#' \item donors. Organ Donation rate per million population.
#' \item pop. Population in thousands.
#' \item pop.dens. Population density per square mile.
#' \item gdp. Gross Domestic Product in thousands of PPP dollars.
#' \item gdp.lag. Lagged Gross Domestic Product in thousands of PPP dollars.
#' \item health. Health spending, thousands of PPP dollars per capita.
#' \item health.lag Lagged health spending, thousands of PPP dollars
#' per capita.
#' \item pubhealth. Public health spending as a percentage of total expenditure.
#' \item roads. Road accident fatalities per 100,000 population.
#' \item cerebvas. Cerebrovascular deaths per 100,000 population (rounded).
#' \item assault. Assault deaths per 100,000 population (rounded).
#' \item external. Deaths due to external causes per 100,000 population.
#' \item txp.pop. Transplant programs per million population.
#' \item world. Welfare state world (Esping Andersen.)
#' \item opt. Opt-in policy or Opt-out policy.
#' \item consent.law. Consent law, informed or presumed.
#' \item consent.practice. Consent practice, informed or presumed.
#' \item consistent. Law consistent with practice, yes or no.
#' \item ccode. Abbreviated country code.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name organdata
#' @usage data(organdata)
#' @format A (tibble) data frame with 237 rows and 21 variables.
#' @source Macro-economic and spending data: OECD. Other data: Kieran Healy.
"organdata"

#' An untidy table of data
#'
#' A table of data from Wickham (2014).
#'
#' @docType data
#' @keywords datasets
#' @name preg
#' @usage data(preg)
#' @format "An object of class \\code{tbl_df} (inherits from \\code{tbl}, \\code{data.frame}) with 3 rows and 3 columns."
#' @source Hadley Wickham (2014).
"preg"


#' A wider table of untidy data
#'
#' A second table of data from Wickham (2014).
#'
#' @docType data
#' @keywords datasets
#' @name preg2
#' @usage data(preg2)
#' @format "An object of class \\code{tbl_df} (inherits from \\code{tbl}, \\code{data.frame}) with 2 rows and 4 columns."
#' @source Hadley Wickham (2014).
"preg2"

##' A table of survival rates from the Titanic
##'
##' A small table of survival rates from the Titanic, by sex
##'
##' @docType data
##' @keywords datasets
##' @name titanic
##' @format "A data frame with four rows and four columns."
##' @source Titanic data
"titanic"


##' Mauna Loa Atmospheric CO2 Concentration
##'
##' A subset of the co2 data in base R's [datasets] package, in
##' a ggplot2-friendly format.
##'
##' @docType data
##' @keywords datasets
##' @name maunaloa
##' @format "A data frame with 4 columns and 271 rows."
##' @source R base datasets; Cleveland (1993).
"maunaloa"


##' Monetary Base and S&P 500 series
##'
##' Two time series of financial data from FRED, the _i means indexed
##' to 100 in the base observation.
##'
##' @docType data
##' @keywords datasets
##' @name fredts
##' @format "A data frame with 5 columns and 357 rows."
##' @source FRED data.
"fredts"
