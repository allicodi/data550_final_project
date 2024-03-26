# -----------------------------------------------
# 02_make_figures.R
# Script to make relevant figures for abcd dataset
# -----------------------------------------------

library(ggplot2)

here::i_am("R/02_make_figures.R")

# List of all pathogens in dataset
pathogen_vars <- c("rotavirus_new",
                   "norovirus_new",
                   "adenovirus_new",
                   "astrovirus_new",
                   "sapovirus_new",
                   "st_etec_new",
                   "shigella_new",
                   "campylobacter_new",
                   "tepec_new",
                   "v_cholerae_new",
                   "salmonella_new",
                   "cryptosporidium_new")

plots_list <- list()
summary_stats <- data.frame()
fig_num <- 1

# Iterate through all pathogen variables and make plot for each
suppressWarnings({
  
  for(covariate in pathogen_vars){
    
    num_gt_0 <- length(which(abcd_data[[covariate]] > 0))
    mean_cov <- mean(abcd_data[[covariate]], na.rm = TRUE)
    sd_cov <- sd(abcd_data[[covariate]], na.rm = TRUE)
    median_cov <- median(abcd_data[[covariate]] , na.rm = TRUE)
    min_cov <- min(abcd_data[[covariate]])
    max_cov <- max(abcd_data[[covariate]])
    
    # Create dataframe of summary statistics for each pathogen
    summary_stats <- rbind(summary_stats, data.frame(covariate = covariate,
                                                     label = attr(abcd_data[[covariate]], "label"),
                                                     num_gt_0 = num_gt_0,
                                                     mean = mean_cov,
                                                     sd = sd_cov,
                                                     median = median_cov,
                                                     min_cov = min_cov,
                                                     max_cov = max_cov))
    
    plot_obj <- ggplot(abcd_data, aes(x = .data[[covariate]])) +
      geom_histogram(aes(y = ..count..), fill = "skyblue", color = "black", alpha = 0.8) +
      labs(title = paste("Distribution of", label(abcd_data[[covariate]])),
           x = label(abcd_data[[covariate]]),
           y = "Frequency") + 
      annotate("text", x = Inf, y = Inf, hjust = 1, vjust = 1.1,
               label = paste("Mean:", round(mean_cov, 2), "\nStandard Deviation:", round(sd_cov, 2), "\nMedian:", round(median_cov, 2), "\nMin:", round(min_cov, 2), "\nMax:", round(max_cov, 2), "\n\n Number of participants with pathogen detected:", num_gt_0)) +
      ggtitle(paste("Figure", fig_num, ": Frequency Histogram of", label(abcd_data[[covariate]])))
    
    # Store the plot object in the list
    plots_list[[covariate]] <- plot_obj
    
    fig_num <- fig_num + 1
  }
})

# Save all plots in plots_list to output folder
for(plot_num in 1:length(plots_list)){
  ggsave(paste0("output/figure_", plot_num, ".png"), plots_list[[plot_num]])
}

# Save pathogen summary statistics to output folder
write.csv(summary_stats, "output/summary_stats.csv", row.names = FALSE)
