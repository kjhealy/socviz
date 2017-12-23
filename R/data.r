#' General Social Survey data, 2016
#'
#' A dataset containing an extract from the 2016 General Social
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
#' \item pres12. raw variable for whether the Respondent voted for
#' Obama. Recoded to obama in this dataset.
#' \item wtssall. weight variable.
#' \item income_rc. Recoded income variable.
#' \item agegrp. Age variable recoded into age categories
#' \item ageq. Age recoded into quartiles.
#' \item siblings. Top-coded sibs variable.
#' \item kids. Top-coded childs variable.
#' \item bigregion. Region variable (Census divisions) recoded to four Census regions.
#' \item religion. relig variable recoded to six categories.
#' \item partners_rc. partners variable recoded to five categories.
#' \item obama. Respondent says the voted for Obama in 2012. 1 = yes;
#' 0 = all other non-design options (Romney, other candidate, did not
#' vote, refused, etc.)
#' }
#'
#' @docType data
#' @keywords datasets
#' @name gss_sm
#' @format A data frame with 2538 rows and 26 variables.
#' @source National Opinion Research Center, http://gss.norc.org.
"gss_sm"


#' General Social Survey data, 1972-2016
#'
#' A dataset containing an extract from the General Social
#' Survey. See http://gss.norc.org/Get-Documentation for full
#' documentation of the variables. This data contains the same
#' variables as `gss_sm`, but for all available years from 1972-2016.
#'
#' \itemize{
#' \item year. gss year for this respondent.
#' \item id. respondent id number.
#' \item ballot. ballot used for interview.
#' \item age. age of respondent.
#' \item degree. Rs highest degree.
#' \item race. race of respondent.
#' \item sex. respondent's sex.
#' \item siblings. Number of brothers and sisters (recoded from SIBS).
#' \item kids. Number of children (recoded from CHILDS).
#' \item bigregion. region of interview (recoded from REGION).
#' \item income16. total family income.
#' \item religion. rs religious preference (recoded from RELIGION)
#' \item marital. marital status.
#' \item padeg. fathers highest degree.
#' \item madeg. mothers highest degree.
#' \item partyid. political party affiliation.
#' \item polviews. think of self as liberal or conservative.
#' \item happy. general happiness.
#' \item partners_rc. how many sex partners r had in last year.
#' (Recoded from PARTNERS)
#' \item grass. should marijuana be made legal.
#' \item zodiac. respondents astrological sign.
#' \item pres12. R's stated vote in the 2012 Presidential election
#' \item wtssall. weight variable.
#' \item vpsu. Sampling unit
#' \item vstrat. Stratification unit
#' }
#'
#' @docType data
#' @keywords datasets
#' @name gss_lon
#' @format A data frame with 62,366 rows and 26 variables.
#' @source National Opinion Research Center, http://gss.norc.org.
"gss_lon"


#' General Social Survey data, 1972-2016
#'
#' A dataset containing an extract from the General Social
#' Survey. See http://gss.norc.org/Get-Documentation for full
#' documentation of the variables. This data contains seven
#' variables from `gss_lon` with all NA values omitted.
#'
#' \itemize{
#' \item year. gss year for this respondent.
#' \item id. respondent id number.
#' \item age. age of respondent.
#' \item race. race of respondent.
#' \item sex. respondent's sex.
#' \item siblings. Number of brothers and sisters (recoded from SIBS).
#' \item kids. Number of children (recoded from CHILDS).
#' }
#'
#' @docType data
#' @keywords datasets
#' @name gss_sib
#' @format A data frame with 60,423 rows and 7 variables.
#' @source National Opinion Research Center, http://gss.norc.org.
"gss_sib"

#' US Presidential Election 2016, State-level results
#'
#' State-level vote totals and shares for the 2016 US Presidential election.
#'  The variables are as follows:
#' \itemize{
#' \item state. State name.
#' \item st. State abbreviation.
#' \item fips. State FIPS code
#' \item total_vote. Total votes cast.
#' \item vote_margin. Winner's vote margin
#' \item winner. Winning candidate.
#' \item party. Winning party.
#' \item pct_margin. Winner's percentage margin (of total vote)
#' \item r_points. Percentage point difference between Trump % vote
#'  share and Clinton % vote share
#' \item d_points. Percentage point difference between Clinton % vote
#'  share and Trump % vote share.
#' \item pct_clinton. Clinton vote share (%)
#' \item pct_trump. Trump vote share (%)
#' \item pct_johnson. Johnson vote share (%)
#' \item pct_other. Other vote share (%)
#' \item clinton_vote. Clinton vote total
#' \item trump_vote. Trump vote total
#' \item johnson_vote. Johnson vote total
#' \item other_vote. Other vote total
#' \item ev_dem. Electoral votes for Clinton
#' \item ev_rep. Electoral votes for Trump
#' \item ev_oth. Electoral votes for Other
#' \item census. Census region.
#'}
#'
#' @docType data
#' @keywords datasets
#' @name election
#' @format A (tibble) data frame with 51 rows and 22 variables.
#' @source Vote data from Dave Leip, US Election Atlas, http://uselectionatlas.org.
"election"



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
#' \item win_party. Party affiliation of winner.
#' \item ec_pct. Winner's share of electoral college vote.
#' (Range is 0 to 1.)
#' \item popular_pct. Winner's share of popular vote. (Range is 0 to 1.)
#' \item popular_margin. Winner's point margin in the popular vote.
#' Can be positive or negative.
#' \item votes. Total votes cast in the election.
#' \item margin. Winner's vote margin in the popular vote.
#' \item runner_up. Runner up candidate.
#' \item ru_part. Party affiliation of runner up candidate.
#' \item turnout_pct. Voter turnout as a proportion of eligible
#' voters. (Rate is 0 to 1.)
#' \item winner_lname Last name of winner.
#' \item winner_label Winner's last name and election year.
#' \item ru_lastname. Runner up's last name.
#' \item ru_label. Runner up's last name and election year.
#' \item two_term. Is this a two term presidency? (TRUE/FALSE.) Note
#' that F.D. Roosevelt was elected four times.
#' \item ec_votes. Electoral college votes cast for winner.
#' \item ec_denom. Total number of electoral college votes.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name elections_historic
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
#' \item pop_dens. Population density per square mile.
#' \item gdp. Gross Domestic Product in thousands of PPP dollars.
#' \item gdp_lag. Lagged Gross Domestic Product in thousands of PPP dollars.
#' \item health. Health spending, thousands of PPP dollars per capita.
#' \item health_lag Lagged health spending, thousands of PPP dollars
#' per capita.
#' \item pubhealth. Public health spending as a percentage of total expenditure.
#' \item roads. Road accident fatalities per 100,000 population.
#' \item cerebvas. Cerebrovascular deaths per 100,000 population (rounded).
#' \item assault. Assault deaths per 100,000 population (rounded).
#' \item external. Deaths due to external causes per 100,000 population.
#' \item txp_pop. Transplant programs per million population.
#' \item world. Welfare state world (Esping Andersen.)
#' \item opt. Opt-in policy or Opt-out policy.
#' \item consent_law. Consent law, informed or presumed.
#' \item consent_practice. Consent practice, informed or presumed.
#' \item consistent. Law consistent with practice, yes or no.
#' \item ccode. Abbreviated country code.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name organdata
#' @format A (tibble) data frame with 237 rows and 21 variables.
#' @source Macro-economic and spending data: OECD. Other data: Kieran Healy.
"organdata"


#' Dates in character form
#'
#' A table of dates and observations with the date column stored as a
#' character string.
#'
#' @docType data
#' @keywords datasets
#' @name bad_date
#' @format "A tibble with 10 rows and two columns."
#' @source Chris Delcher.
"bad_date"


#' An untidy table of data
#'
#' A table of data from Wickham (2014).
#'
#' @docType data
#' @keywords datasets
#' @name preg
#' @format "A tbl_df with 3 rows and 3 columns."
#' @source Hadley Wickham (2014).
"preg"


#' A wider table of untidy data
#'
#' A second table of data from Wickham (2014).
#'
#' @docType data
#' @keywords datasets
#' @name preg2
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


##' Years of school completed by people 25 years and over in the US.
##'
##' Counts of educational attainment (in thousands) from 1940 to 2016
##'
##' \itemize{
##' \item age Character. Cut into 25-34, 35-54, 55>
##' \item sex Character. Male, Female.
##' \item year Integer.
##' \item total Integer. Total in thousands.
##' \item elem4 Double. 0 to 4 years of Elementary School completed.
##' \item elem8 Double. 5 to 8 years of Elementary School completed.
##' \item hs3 Double. 1 to 3 years of High School completed.
##' \item hs4 Double. 4 years of High School completed.
##' \item coll3 Double. 1 to 3 years of College completed.
##' \item coll4 Double. 4 or more years of College completed.
##' \item median Double. Median years of education.
##'}
##'
##' @docType data
##' @keywords datasets
##' @name edu
##' @format "A tibble with 366 rows and 11 columns."
##' @source US Census Bureau
"edu"



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



##' Yahoo Revenue and Employees
##'
##' Data on Revenue and Employees at Yahoo before and during Marissa
##' Mayer's tenure as CEO.
##'
##' @docType data
##' @keywords datasets
##' @name yahoo
##' @format "A data frame with 4 columns and 11 rows."
##' @source QZ.com
"yahoo"


##' Student debt data
##'
##' Outstanding student debts in 2016 across 8 income categories, by
##' percent of all borrowers and percent of all balances.
##'
##' @docType data
##' @keywords datasets
##' @name studebt
##' @format "A tibble with 16 rows and 4 columns."
##' @source Federal Reserve Bank of New York
"studebt"


##' American Sociological Association Section Membership
##'
##' Membership (2005-2015) and some financial information for sections
##' of the American Sociolgical Association
##'
##'
##' @docType data
##' @keywords datasets
##' @name asasec
##' @format "A data frame with 572 rows and 9 columns."
##' @source ASA Annual Report 2016
"asasec"


##' Census Data on US Counties
##'
##' Selected county data (including state-level observations on some variables)
##' \itemize{
##' \item id. FIPS State and County code (character)
##' \item name. State or County Name
##' \item state. State abbreviation
##' \item census_region. Census region
##' \item pop_dens. Population density per square mile, 2014 estimate
##' (seven categories).
##' \item pop_dens4. Population density per square mile, 2014 estimate (quartiles)
##' \item pop_dens6. Poptulation density per square mile, 2014
##' estimate (six categories)
##' \item pct_black. Percent black population, 2014 estimate (seven
##' category factor)
##' \item pop. Population, 2014 estimate
##' \item female. Female persons, percent, 2013
##' \item white. White alone, percent, 2013
##' \item black. Black alone, percent, 2013
##' \item travel_time. Mean travel time to work (minutes), workers age 16+, 2009-2013
##' \item land_area. Land area in square miles, 2010
##' \item hh_income. Median household income, 2009-2013
##' \item su_gun4. Firearm-related suicides per 100,000 population,
##' 1999-2015. Factor variable cut into quartiles. Note that the
##' values in this variable contain an inaccurate bottom-quartile
##' coding by construction. Do not present this variable as an
##' accurate measure of the firearm-related suicide rate.
##' \item su_gun6. Firearm-related suicides per 100,000 population,
##' 1999-2015. Factor variable cut into six categories. Note that the
##' values in this variable contain an inaccurate bottom-quartile
##' coding by construction. Do not present this variable as an
##' accurate measure of the firearm-related suicide rate.
##' \item fips. FIPS code (integer).
##' \item votes_dem_2016. Provisional count of Democratic votes in the
##' 2016 Presidential election.
##' \item votes_gop_2016. Provisional count of Republican votes in the
##' 2016 Presidential election.
##' \item total_votes_2016. Provitional count of votes cast in the
##' 2016 Presidential election.
##' \item per_dem_2016. Democratic Presidential vote, percent.
##' \item per_gop_2016. Republican Presidental vote, percent.
##' \item diff_2016. Difference between Democratic and Republican
##' Presidental vote.
##' \item votes_dem_2012. Provisional count of Democratic votes in the
##' 2012 Presidential election.
##' \item votes_gop_2012. Provisional count of Republican votes in the
##' 2012 Presidential election.
##' \item total_votes_2012. Provitional count of votes cast in the
##' 2012 Presidential election.
##' \item per_dem_2012. Democratic Presidential vote, percent.
##' \item per_gop_2012. Republican Presidental vote, percent.
##' \item diff_2012. Difference between Democratic and Republican
##' Presidental vote.
##' \item winner. Winning candidate, 2016 Presidental Election.
##' \item partywinner16. Winning party, 2016 Presidental Election.
##' \item winner12. Winning candidate, 2012 Presidental Election.
##' \item partywinner12. Winning party, 2012 Presidental Election.
##' \item fipped. Did the area flip parties from 2012 to 2016.
##' }
##'
##' @docType data
##' @keywords datasets
##' @name county_data
##' @format "A data frame with 3195 rows and 13 columns."
##' @source US Census Bureau, Centers for Disease Control
"county_data"


##' US County map file
##'
##' US county map data
##'
##' \itemize{
##' \item long. Longitude
##' \item lat. Latitude
##' \item order. Order
##' \item hole. Hole (true/false)
##' \item piece. Piece
##' \item group. Group
##' \item id. FIPS code
##' }
##'
##' @docType data
##' @keywords datasets
##' @name county_map
##' @format "A data frame with 191,372 rows and 7 columns."
##' @source Eric Celeste
"county_map"



##' Opiate-Related Deaths in the United States, 1999-2014
##'
##' State-level data on optiate related deaths in the US, from the CDC
##' Wonder database. Query details: Dataset is Multiple causes of
##' death, 1999-2014; 2006 Urbanization; Autopsy, Gender, Place of
##' Death, States, 10-year age groups, and Hisipanic Origin, Weekday,
##' Year/Month set to ALL. Standard Population 2000 US Std Population.
##' Default intercensal populations for years 2001-2009 except Infant
##' age groups. Rates per 100,000 population.
##' MCD ICD-10 Codes selected: T40.0 (Opium), T40.1 (Heroin), T40.2
##' (Other opioids), T40.3 (Methadone), T40.4 (Other synthetic
##' narcotics), T40.6 (Other and unspecified narcotics). UCD - ICD-10
##' Codes selected: X40-X44, X60-X64, X85, Y10-Y14.
##'
##' The variables are as follows:
#'
#' \itemize{
#' \item year. Year
#' \item state. State name.
#' \item fips. State FIPS code.
#' \item deaths. Number of opiate-related deaths.
#' \item population. Population.
#' \item crude. Crude death rate.
#' \item adjusted. Adjusted death rate.
#' \item adjusted.se. Standard error of Adjusted death rate.
#' \item region. Census region. (Stored as an ordered factor.)
#' \item abbr. Abbreviated state name.
#' }
##'
##' @docType data
##' @keywords datasets
##' @name opiates
##' @format "A tibble with 800 rows and 10 columns."
##' @source Centers for Disease Control CDC WONDER data
"opiates"


##' US Law School Enrollments 1963-2015
##'
##' Annual enrollments in US Law Schools.
##'
##' The variables are as follows:
#'
#' \itemize{
#' \item  ay. Academic year. character.
#' \item  year. Year. integer.
#' \item  n_schools. Number of law schools. integer.
#' \item  fy_enrollment. First year enrollment. integer.
#' \item  fy_male. First year enrollment, men. integer.
#' \item  fy_female. First year enrollment, women. integer.
#' \item  jd_total. Total JD enrollment. integer.
#' \item  jd_male. Total JD enrollment, men. integer.
#' \item  jd_female. Total JD enrollment, women. integer.
#' \item  tot_enrolled. Total enrolled. integer.
#' \item  jd_llb_awarded. JD/LLB degrees awarded. integer.
#' }
##'
##' @docType data
##' @keywords datasets
##' @name lawschools
##' @format "A tibble with 53 rows and 11 columns."
##' @source American Bar Association
"lawschools"
