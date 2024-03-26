# -----------------------------------------------
# 01_make_tables.R
# Script to make relevant tables for abcd dataset
# -----------------------------------------------

here::i_am("R/01_make_tables.R")

# ------- Table 1: Sociodemographic Characteristics ---------
sociodem_df <- abcd_data[,c("an_grp_01", "agemchild", "dy1_ant_sex", "an_ses_quintile", "an_tothhlt5", "site", "month_en", "rotaseason")]

# Create summary table using gtsummary
sociodemographic_table <- tbl_summary(
  data = sociodem_df,
  by = an_grp_01,
  missing = "no",
  type = list(
    agemchild ~ "continuous",
    dy1_ant_sex ~ "categorical",
    an_ses_quintile ~ "categorical",
    an_tothhlt5 ~ "continuous",
    site ~ "categorical",
    month_en ~ "categorical",
    rotaseason ~ "categorical"
  )
) %>%
  add_overall() %>%
  modify_table_styling(label = "**Characteristic**") %>%
  modify_caption("Table 1: Sociodemographic characteristics of simulated ABCD study population")

# Save the summary table
saveRDS(
  sociodemographic_table,
  file = "output/table_1.Rds"
)


# ------- Table 2: Illness Characteristics ---------
illness_df <- abcd_data[,c("an_grp_01", "dy1_scrn_vomitall", "dy1_scrn_dehydr", "dy1_scrn_lstools", "dy1_scrn_sstools")]

# Create summary table using gtsummary
illness_table <- tbl_summary(
  data = illness_df,
  by = an_grp_01,
  missing = "no",
  type = list(
    dy1_scrn_lstools ~ "continuous",
    dy1_scrn_sstools ~ "continuous",
    dy1_scrn_vomitall ~ "categorical",
    dy1_scrn_dehydr ~ "categorical"
  )
) %>%
  add_overall() %>%
  modify_table_styling(label = "**Characteristic**") %>%
  modify_caption("Table 2: Illness characteristics of simulated ABCD study population")

# Save the summary table
saveRDS(
  illness_table,
  file = "output/table_2.Rds"
)

# ------- Table 3: Malnutrition Characteristics ---------
malnutrition_df <- abcd_data[,c("an_grp_01", "avemuac", "lfazscore",  "wfazscore", "wflzscore")]

# Create summary table using gtsummary
malnutrition_table <- tbl_summary(
  data = malnutrition_df,
  by = an_grp_01,
  missing = "no"
) %>%
  add_overall() %>%
  modify_table_styling(label = "**Characteristic**") %>%
  modify_caption("Table 3: Malnutrition characteristics of simulated ABCD study population")

# Save the summary table
saveRDS(
  illness_table,
  file = "output/table_3.Rds"
)

