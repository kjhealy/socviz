#' US County Poverty Rates by Age Group
#'
#' A dataset of US poverty rates by selected age groups within counties.
#'
#' \itemize{
#' \item fips. County FIPS code.
#' \item age_group. Adults 18-64, Children <18, Seniors 65+.
#' \item age_rate. Poverty rate (percent) for `age_group` in county.
#' \item total_rate. Poverty rate (percent) for all ages in county.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name acs_poverty
#' @format A tibble with 9,666 rows and 4 columns.
#' @source American Community Survey 2023 ACS 5-year estimates, Table B17018.
"acs_poverty"

#' US County Poverty Rates by Age Group, Longer Version
#'
#' A dataset of US poverty rates by selected age groups within counties.
#'
#' \itemize{
#' \item geoid. County FIPS code.
#' \item age_group. Adults 18-64, Children <18, Seniors 65+, All Ages.
#' \item prop_poor. Proportion (0-1) of `age_group` in poverty within county.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name acs_poverty_lon
#' @format A tibble with 12,888 rows and 3 columns.
#' @source American Community Survey 2023 ACS 5-year estimates, Table B17018.
"acs_poverty_lon"


#' US County Components of Population Change
#'
#' A dataset of components of population change (rates only) for US Counties in 2023.
#'
#' \itemize{
#' \item fips. County FIPS code.
#' \item county. County name.
#' \item state. State abbreviation.
#' \item rbirth. Birth rate.
#' \item rdeath. Death rate.
#' \item rnatchg. Natural change rate.
#' \item rintl. International migration rate.
#' \item rdom. Domestic migration rate.
#' \item rnetmig. Net migration rate.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name county_comp
#' @format A tibble with 3,144 rows and 8 columns.
#' @source US Census Bureau Components of Population Change 2023 estimates.
"county_comp"

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
#' @format A data frame with 2538 rows and 26 columns.
#' @source National Opinion Research Center, http://gss.norc.org.
"gss_sm"


#' General Social Survey data, 1972-2024
#'
#' A dataset containing an extract from the General Social
#' Survey. See http://gss.norc.org/Get-Documentation for full
#' documentation of the variables. This data contains many of the same
#' variables as `gss_sm`, but for all available years from 1972-2024.
#'
#' \itemize{
#' \item year. GSS year for this respondent.
#' \item id. Respondent id number.
#' \item ballot. Ballot used for interview.
#' \item age. Age of respondent.
#' \item degree. R's highest degree.
#' \item race. Race of respondent.
#' \item sex. Respondent's sex.
#' \item siblings. Number of brothers and sisters (recoded from SIBS).
#' \item kids. Number of children (recoded from CHILDS).
#' \item bigregion. Region of interview (identical with REGION).
#' \item region. Region of interview.
#' \item income16. Total family income.
#' \item religion. R's religious preference (recoded from RELIGION)
#' \item marital. Marital status.
#' \item padeg. Father's highest degree.
#' \item madeg. Mother's highest degree.
#' \item partyid. Political party affiliation.
#' \item polviews. Think of self as liberal or conservative.
#' \item happy. General happiness.
#' \item partners_rc. How many sex partners r had in last year. (Recoded from PARTNERS)
#' \item grass. Should marijuana be made legal.
#' \item zodiac. Respondent's astrological sign.
#' \item wtssall. Person weight variable (1972-2018).
#' \item wtssps. Person weight variable (1972-2024).
#' \item vpsu. Sampling unit
#' \item vstrat. Stratification unit
#' }
#'
#' @docType data
#' @keywords datasets
#' @name gss_lon
#' @format A data frame with 75,699 rows and 25 columns.
#' @source National Opinion Research Center, http://gss.norc.org.
"gss_lon"


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
#' \item pct_margin. Winner's percentage margin (proportion of total vote)
#' \item r_points. Percentage point difference between Trump % vote
#'  share and Clinton % vote share
#' \item d_points. Percentage point difference between Clinton % vote
#'  share and Trump % vote share.
#' \item pct_clinton. Clinton vote share (proportion)
#' \item pct_trump. Trump vote share (proportion)
#' \item pct_johnson. Johnson vote share (proportion)
#' \item pct_other. Other vote share (proportion)
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
#' @format A (tibble) data frame with 51 rows and 22 columns.
#' @source Vote data from Dave Leip, US Election Atlas, http://uselectionatlas.org.
"election"

#' US Presidential Election 2024, State-level results
#'
#' State-level vote totals and shares for the 2024 US Presidential election.
#'
#' @format ## `election24`
#' A data frame with 51 rows and 20 columns:
#' \describe{
#'   \item{state}{State name.}
#'   \item{st}{State abbreviation.}
#'   \item{fips}{State FIPS code (character).}
#'   \item{total_vote}{Total votes case.}
#'   \item{vote_margin}{Vote margin (Trump positive values; Harris negative.)}
#'   \item{winner}{Winning candidate.}
#'   \item{party}{Winning party.}
#'   \item{pct_margin}{Winner's percentage margin (proportion of total vote)}
#'   \item{r_points}{Percentage point difference between Trump vote percent and Harris vote percent}
#'   \item{d_points}{Percentage point difference between Harris vote percent and Trump vote percent}
#'   \item{pct_harris}{Harris vote share (proportion)}
#'   \item{pct_trump}{Trump vote share (proportion)}
#'   \item{pct_other}{Other vote share (proportion)}
#'   \item{harris_vote}{Harris vote total}
#'   \item{trump_vote}{Trump vote total}
#'   \item{other_vote}{Other vote total}
#'   \item{ev_dem}{Electoral votes for Harris}
#'   \item{ev_rep}{Electoral votes for Trump}
#'   \item{ev_other}{Electoral votes for Others}
#'   \item{census}{Census region}
#' }
#' @docType data
#' @keywords datasets
#' @name election24
#' @author Kieran Healy
#' @source Vote data from Wikipedia, https://en.wikipedia.org/wiki/2024_United_States_presidential_election
"election24"


#' US Presidential Election vote shares
#'
#' A dataset of US presidential elections from 1824 to 2024, with
#'  information on the winner, runner up, and various measures of vote
#'  share. The variables are as follows:
#'
#' \itemize{
#' \item election. Number of the election counting from the first US
#' presidential election. 1824 is the 10th election.
#' \item year. Year.
#' \item winner. Full name of winner.
#' \item win_party. Party affiliation of winner.
#' \item ec_votes. Electoral college votes for winner.
#' \item ec_denom. Number of votes in the electoral college.
#' \item ec_pct. Winner's share of electoral college vote. (A proportion. Range is 0 to 1.)
#' \item popular_pct. Winner's share of popular vote. (A proportion. Range is 0 to 1.)
#' \item popular_margin. Winner's margin of the popular vote, expressed as a proportion. Can be positive or negative.
#' \item votes. Total votes cast in the election.
#' \item margin. Winner's vote margin in the popular vote.
#' \item runner_up. Runner up candidate.
#' \item ru_part. Party affiliation of runner up candidate.
#' \item turnout_pct. Voter turnout as a proportion of eligible voters. (A proportion. Range is 0 to 1.)
#' \item winner_lname Last name of winner.
#' \item winner_label Winner's last name and election year.
#' \item ru_lastname. Runner up's last name.
#' \item ru_label. Runner up's last name and election year.
#' \item two_term. Is this a two term presidency? (TRUE/FALSE.) Note that F.D. Roosevelt was elected four times.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name elections_historic
#' @format A (tibble) data frame with 51 rows and 19 columns.
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
#' @format A (tibble) data frame with 237 rows and 21 columns.
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
#' @format A tibble with 10 rows and two columns.
#' @source Chris Delcher.
"bad_date"


#' An untidy table of data
#'
#' A table of data from Wickham (2014).
#'
#' @docType data
#' @keywords datasets
#' @name preg
#' @format A tbl_df with 3 rows and 3 columns.
#' @source Hadley Wickham (2014).
"preg"


#' A wider table of untidy data
#'
#' A second table of data from Wickham (2014).
#'
#' @docType data
#' @keywords datasets
#' @name preg2
#' @format An tbl_df object (inherits from tbl, data.frame) with 2 rows and 4 columns.
#' @source Hadley Wickham (2014).
"preg2"

##' A table of survival rates from the Titanic
##'
##' A small table of survival rates from the Titanic, by sex
##'
##' @docType data
##' @keywords datasets
##' @name titanic
##' @format A data frame with four rows and four columns.
##' @source Titanic data
"titanic"


##' A table of hex color values related to types of color blindness
##'
##' Hex values for five default ggplot colors, with corresponding
##' approximations for three kinds of color blindness. Produced by the
##' `dichromat` package.
##'
##' @docType data
##' @keywords datasets
##' @name color_table
##' @format A tibble with five rows and four columns.
##' @source Kieran Healy
"color_table"

##' Years of school completed by people 25 years and over in the US.
##'
##' Counts of educational attainment (in thousands) from 1940 to 2016
##'
##' The variables are as follows:
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
##' @format A tibble with 366 rows and 11 columns.
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
##' @format A data frame with 4 columns and 271 rows.
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
##' @format A data frame with 5 columns and 357 rows.
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
##' @format A tibble with 4 columns and 12 rows.
##' @source QZ.com
"yahoo"


#' Student debt data
#'
#' Outstanding student debts in 2016 across 8 income categories, by
#' percent of all borrowers and percent of all balances.
#' @format ## `studebt`
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{Debt}{Debt categories (character)}
#'   \item{type}{Pct in terms of Borrowers or Balances}
#'   \item{pct}{Percentage of all type}
#'   \item{Debtrc}{Debt categories (ordered factor)}
#' }
#' @docType data
#' @keywords datasets
#' @name studebt
#' @source Federal Reserve Bank of New York.
"studebt"

#' American Sociological Association Section Membership
#'
#' Membership and some financial information for sections
#' of the American Sociological Association in 2014/15.
#'
#' @format ## `asasec`
#' A data frame with 52 rows and 9 columns:
#' \describe{
#'   \item{Section}{Section name.}
#'   \item{Sname}{Short name.}
#'   \item{Beginning}{Cash on hand at beginning of year (2015).}
#'   \item{Revenues}{Membership revenues.}
#'   \item{Expenses}{Section expenses.}
#'   \item{Ending}{Cash on hand at end of year (2015).}
#'   \item{Journal}{Does the Section run a journal?}
#'   \item{Year}{Membership year.}
#'   \item{Members}{Number of members (2014).}
#' }
#'
#' @details Data from the American Sociological Association.
#' @author Kieran Healy
#' @source ASA Annual Report 2016.
"asasec"

#' US State geometries
#'
#' US State map data layer
#'
#' @format ## `states_sf`
#' A simple features object with 51 rows and 5 columns:
#' \describe{
#'   \item{fips}{State FIPS code}
#'   \item{st}{State name abbreviation}
#'   \item{state}{State name}
#'   \item{census}{Census region}
#'   \item{geometry}{Geometry}
#' }
#' @details A simple features object. Load the `sf` package before using. Alaska and Hawaii have had their geometries scaled and shifted to the bottom left of the map area. Alaska's Aleutian islands are not included.
#' @author Kieran Healy
#' @source US Census Bureau.
"states_sf"

#' US County geometries and demographic data
#'
#' US County map data layer with selected Census Bureau demographic variables.
#'
#' @format ## `counties_sf`
#' A simple features object 3,144 rows and 16 columns:
#' \describe{
#'   \item{fips}{FIPS code.}
#'   \item{name}{County name.}
#'   \item{area_sqmi}{Area in square miles.}
#'   \item{white}{N White population.}
#'   \item{black}{N Black population.}
#'   \item{asian}{N Asian population.}
#'   \item{nh_white}{N Non-Hispanic White population.}
#'   \item{hispanic}{N Hispanic population.}
#'   \item{pop}{Total population.}
#'   \item{black_disc}{Percent Black, discretized.}
#'   \item{hisp_disc}{Percent Hispanic, discretized.}
#'   \item{nhwhite_disc}{Percent Non-Hispanic White, discretized.}
#'   \item{asian_disc}{Percent Asian, discretized.}
#'   \item{pop_dens}{Population density per square mile.}
#'   \item{pop_dens_disc}{Population density per square mile, discretized.}
#' \item{su_gun6}{Firearm-related suicides per 100,000 population,
#' 1999-2015. Factor variable cut into six categories. Note that the
#' values in this variable contain an inaccurate bottom-quartile
#' coding by construction. Do not present this variable as an
#' accurate measure of the firearm-related suicide rate.}
#' \item{pop_dens6}{Population density per square mile, discretized into six categories, 2014 estimates.}
#'   \item{geometry}{Geometry.}
#' }
#' @details A simple features object. Load the `sf` package before using. Alaska and Hawaii have had their geometries scaled and shifted to the bottom left of the map area. Alaska's Aleutian islands are not included. Except where noted, population counts and other demographic information are from the 2024 5-year ACS estimates.
#' @author Kieran Healy
#' @source US Census Bureau.
"counties_sf"


##' Census Data on US Counties
##'
##' Selected county data (including US and state-level observations on some
##' variables). Preserved for use with the first edition of the book only.
##'
##' The variables are as follows:
##' \itemize{
##' \item id. FIPS State and County code (character)
##' \item name. State or County Name
##' \item state. State abbreviation
##' \item census_region. Census region
##' \item pop_dens. Population density per square mile, 2014 estimate
##' (seven categories).
##' \item pct_black. Percent black population, 2014 estimate (seven
##' category factor)
##' \item pop_dens6. Population density per square mile, 2014 estimate
##' (six categories)
##' \item su_gun6. Firearm-related suicides per 100,000 population,
##' 1999-2015. Factor variable cut into six categories. Note that the
##' values in this variable contain an inaccurate bottom-quartile
##' coding by construction. Do not present this variable as an
##' accurate measure of the firearm-related suicide rate.
##' }
##'
##' @docType data
##' @keywords datasets
##' @name county_data
##' @format A data frame with 3195 rows and 13 columns.
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
##' @format A data frame with 191,372 rows and 7 columns.
##' @source Eric Celeste
"county_map"


#' US County-level Presidential Election data, 2024
#'
#' A tibble with US presidential election data
#'
#' @format ## `election24_county_df`
#' A tibble object with 3,153 rows and 7 columns:
#' \describe{
#'   \item{fips}{County FIPS code.}
#'   \item{st}{State name abbreviation}
#'   \item{votes_dem}{Votes for Harris/Walz ticket.}
#'   \item{votes_gop}{Votes for Trump/Vance ticket.}
#'   \item{total_votes}{Total votes cast.}
#'   \item{winner}{Winning party.}
#'   \item{flipped}{Did the party winner change from the winner in 2020? (Yes/No)}
#' }
#' @details A tibble.
#' @author Kieran Healy
#' @source Election data derived from https://doi.org/10.7910/DVN/VOQCHQ
"election24_county_df"


#' Opiate-Related Deaths in the United States, 1999-2020
#'
#' State-level data on opiate related deaths in the US, from the CDC WONDER database.
#'
#' @format ## `opiates`
#' A tibble frame with 1,122 rows and 8 columns:
#' \describe{
#'   \item{fips}{State FIPS code.}
#'   \item{st}{State abbreviation.}
#'   \item{year}{Year.}
#'   \item{deaths}{N opiate-related deaths.}
#'   \item{crude}{Crude death rate per 100,000 population.}
#'   \item{adjusted}{Adjusted death rate.}
#'   \item{region}{Census region.}
#'   \item{division_name}{Census division.}
#' }
#' @details Dataset is Multiple Cause of Death, 1999-2020. Standard Population: 2000 U.S. Std. Population. Rates per 100,000. Default intercensal populations for years 2001-2009. MCD ICD-10 Codes selected: T40.0 (Opium), T40.1 (Heroin), T40.2 (Other opioids), T40.3 (Methadone), T40.4 (Other synthetic narcotics), T40.6 (Other and unspecified narcotics). UCD ICD-10 Codes selected: X40-X44, X60-X64, X85, Y10-Y14.
#' @author Kieran Healy
#' @source CDC WONDER, http://wonder.cdc.gov/mcd-icd10.html
"opiates"

##' US Law School Enrollments 1963-2015
##'
##' Annual enrollments in US Law Schools.
##'
##' The variables are as follows:
##' \itemize{
##' \item  ay. Academic year. character.
##' \item  year. Year. integer.
##' \item  n_schools. Number of law schools. integer.
##' \item  fy_enrollment. First year enrollment. integer.
##' \item  fy_male. First year enrollment, men. integer.
##' \item  fy_female. First year enrollment, women. integer.
##' \item  jd_total. Total JD enrollment. integer.
##' \item  jd_male. Total JD enrollment, men. integer.
##' \item  jd_female. Total JD enrollment, women. integer.
##' \item  tot_enrolled. Total enrolled. integer.
##' \item  jd_llb_awarded. JD/LLB degrees awarded. integer.
##' }
##'
##' @docType data
##' @keywords datasets
##' @name lawschools
##' @format A tibble with 53 rows and 11 columns.
##' @source American Bar Association
"lawschools"

##' Life Expectancy in the OECD, 1960-2023.
##'
##' Life expectancy data for individual countries.
##'
##' The variables are as follows:
##' \itemize{
##' \item  country. Country. (Character)
##' \item  year. Year. (Integer.)
##' \item  lifeexp. Life Expectancy at Birth, measured in years.
##' \item  is_usa. Indicator for USA or Other country.
##' }
##'
##' @docType data
##' @keywords datasets
##' @name oecd_le
##' @format A tibble with 2,203 rows and 4 columns.
##' @source OECD
"oecd_le"


##' Life Expectancy in the OECD, 1960-2023
##'
##' Life expectancy data summary table.
##'
##' The variables are as follows:
##' \itemize{
##' \item  year. Year. (Integer.)
##' \item  other. Life Expectancy at birth in OECD countries excluding
##' the USA. Measured in years.
##' \item usa. Life Expectancy at birth in the USA. Measured in years.
##' \item  diff. Difference between usa and other.
##' \item hi_lo. Is usa above or below the oecd average?
##' }
##'
##' @docType data
##' @keywords datasets
##' @name oecd_sum
##' @format A tibble with 64 rows and 5 columns.
##' @source OECD
"oecd_sum"


#' Monthly Births in the U.S., 1933-2015
#'
#' Births by month, 1933-2015, with decomposition components.
#'
#' @format ## `okboomer`
#' A data frame with 996 rows and 11 columns:
#' \describe{
#'   \item{date}{Date in date format}
#'   \item{year_fct}{Year as ordered factor}
#'   \item{month_fct}{Month as ordered factor}
#'   \item{n_days}{N of days in this month}
#'   \item{births}{Total births in this month}
#'   \item{total_pop}{Population}
#'   \item{births_pct}{Births as a proportion of total population}
#'   \item{births_pct_day}{Average daily births per million population}
#'   \item{seasonal}{Seasonal component from an STL decomposition of `births_pct_day`}
#'   \item{trend}{Trend component from an STL decomposition of `births_pct_day`}
#'   \item{remainder}{Remainder component from an STL decomposition of `births_pct_day`}
#' }
#' @details Dataset originally constructed to reproduce a visualization exercise by Aaron Penne.
#' @author Kieran Healy
#' @source U.S. Census Bureau.
"okboomer"


#' Child Pedestrians involved in Fatal Motor Vehicle Crashes, 2009-2023
#'
#' Daily data on child pedestrians (aged 0-17 years) involved in a motor vehicle crash that resulted in a fatality.
#'
#' @format ## `farsinvolved`
#' A data frame with 5,490 rows and 4 columns:
#' \describe{
#'   \item{month}{Month (character)}
#'   \item{day}{Day of the month (character)}
#'   \item{year}{Year (character)}
#'   \item{n}{Number of pedestrians}
#' }
#' @details Each row is a day of the year between January 1st 2009 and December 31st 2023. The `n` column is the number of pedestrians in the United States who were involved in a motor vehicle crash that day, where the event resulted in a fatality and where the pedestrian was aged between 0 and 17 years old. The person killed is not necessarily the pedestrian.
#' @author Kieran Healy
#' @source National Highway Traffic Safety Administration (NHTSA) Motor Vehicle Crash Data Querying and Reporting
"farsinvolved"
