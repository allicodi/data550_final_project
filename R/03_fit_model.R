# -----------------------------------------------
# 02_fit_model.R
# Script to fit regression model for ABCD dataset
# -----------------------------------------------

here::i_am("R/03_fit_model.R")

# source script that loads and formats data
source("R/00_load_abcd_data.R")

library(ggplot2)

# fit model (same as the way lazd90 was simulated so we know it should be correct)
abcd_data$shigella_bin <- I(abcd_data$shigella_new > 0)
fit <- glm(lazd90 ~ dy1_scrn_diardays + site + an_ses_quintile + agemchild + lfazscore + shigella_bin + an_grp_01 + 
             shigella_bin*an_grp_01 + 
             shigella_bin*lfazscore*an_grp_01 + 
             shigella_bin*lfazscore*an_grp_01*agemchild, data=abcd_data, family = "gaussian")

pred <- predict(fit, abcd_data, type='response')

# Create ggplot
fig_13 <- ggplot(abcd_data, aes(x = lazd90, y = pred)) +
  geom_point() +
  labs(x = "Actual simulated lazd90 values", y = "Predicted lazd90 values", title = "Figure 13: Actual vs. Predicted Values for simulated lazd90") +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed")  # Add diagonal line for reference

# Save ggplot as an image (e.g., PNG)
ggsave("output/figure_13.png", fig_13)

