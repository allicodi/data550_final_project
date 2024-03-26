# -----------------------------------------------
# 00_load_abcd_data.R
# Script to load & format simulated ABCD dataset
# -----------------------------------------------

library(table1) # for using label later on

here::i_am("R/00_load_abcd_data.R")

# 1. load dataset from data folder
abcd_data <- read.csv("data/abcd_simulated_data550.csv")

# 2. format necessary columns into factors
abcd_data$an_grp_01 <- factor(abcd_data$an_grp_01, levels=c(0,1), 
                              labels=c("Placebo", "Azithromycin"))

abcd_data$dy1_scrn_vomitall <- factor(abcd_data$dy1_scrn_vomitall, levels=c(1,2), 
                                      labels=c("No", "Yes"))

abcd_data$dy1_scrn_dehydr <- factor(abcd_data$dy1_scrn_dehydr, levels=c(1,2,3), 
                                    labels=c("No dehydration", "Some dehydration", "Severe dehydration"))

abcd_data$site <- factor(abcd_data$site, levels=c(2:8),
                         labels=c("Bangladesh", "Kenya", "Malawi", "Mali", "India", "Tanzania", "Pakistan"))

abcd_data$dy1_ant_sex <- factor(abcd_data$dy1_ant_sex, levels=c(1,2),
                                labels=c("Male", "Female"))

abcd_data$an_ses_quintile <- factor(abcd_data$an_ses_quintile, levels=c(1:5),
                                    labels = c("1st quintile of SES",
                                               "2nd quintile of SES",
                                               "3rd quintile of SES",
                                               "4th quintile of SES",
                                               "5th quintile of SES"))

abcd_data$rotaseason <- factor(abcd_data$rotaseason, levels=c(0,1),
                               labels = c("No", "Yes"))

abcd_data$month_en <- factor(abcd_data$month_en, levels = c(1:12),
                             labels = c("January",
                                        "February",
                                        "March",
                                        "April",
                                        "May",
                                        "June",
                                        "July",
                                        "August",
                                        "September",
                                        "October",
                                        "November",
                                        "December"))

# 3. Label all variables (will be used later on to render tables nicely)
label(abcd_data$pid) <- "Participant ID"
label(abcd_data$an_grp_01) <- "Treatment Assignment"
label(abcd_data$rotavirus_new) <- "Rotavirus quantity"
label(abcd_data$norovirus_new) <- "Norovirus quantity"
label(abcd_data$adenovirus_new) <- "Adenovirus quantity"
label(abcd_data$astrovirus_new) <- "Astrovirus quantity"
label(abcd_data$sapovirus_new) <- "Sapovirus quantity"
label(abcd_data$st_etec_new) <- "Enterotoxigenic E. coli quantity"
label(abcd_data$shigella_new) <- "Shigella quantity"
label(abcd_data$campylobacter_new) <- "Campylobacter quantity"
label(abcd_data$tepec_new) <- "Enteropathogenic E.coli"
label(abcd_data$v_cholerae_new) <- "Vibrio cholerae quantity"
label(abcd_data$salmonella_new) <- "Salmonella quantity"
label(abcd_data$cryptosporidium_new) <- "Cryptosporidium quantity"
label(abcd_data$dy1_scrn_vomitall) <- "Child has vomited in current illness episode"
label(abcd_data$dy1_scrn_lstools) <- "Number of loose stools in 24 hour period prior to enrollment"
label(abcd_data$dy1_scrn_sstools) <- "Number of solid stools in 24 hour period prior to enrollment"
label(abcd_data$dy1_scrn_diardays) <- "Number of days of diarrheal illness prior to enrollment"
label(abcd_data$dy1_scrn_dehydr) <- "Level of dehydration"
label(abcd_data$site) <- "Study site"
label(abcd_data$dy1_ant_sex) <- "Sex"
label(abcd_data$agemchild) <- "Age (months)"
label(abcd_data$an_ses_quintile) <- "Socioeconomic status (SES) quintile"
label(abcd_data$an_tothhlt5) <- "Number of children in household under age 5"
label(abcd_data$month_en) <- "Enrollment month"
label(abcd_data$rotaseason) <- "Enrollment during rotavirus season"
label(abcd_data$avemuac) <- "Average middle-upper arm circumference at enrollment"
label(abcd_data$lfazscore) <- "Length for age z-score at enrollment"
label(abcd_data$wfazscore) <- "Weight for age z-score at enrollment"
label(abcd_data$wflzscore) <- "Weight for length z-score at enrollment"
label(abcd_data$lazd90) <- "Length for age z-score at day 90 of trial"

