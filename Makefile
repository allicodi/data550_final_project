#! Rule for rendering the report
report.html: render_report.R report.Rmd output/table_1.Rds output/table_2.Rds output/table_3.Rds output/figure_1.png output/figure_2.png output/figure_3.png output/figure_4.png output/figure_5.png output/figure_6.png output/figure_7.png output/figure_8.png output/figure_9.png output/figure_10.png output/figure_11.png output/figure_12.png output/figure_13.png output/summary_stats.csv
	Rscript render_report.R
	
#! Rule for building the tables
tables: R/01_make_tables.R data/abcd_simulated_data550.csv
	Rscript R/01_make_tables.R
	
#! Rule for building the figures
figures: R/02_make_figures.R data/abcd_simulated_data550.csv
	Rscript R/02_make_figures.R
	
#! Rule for fitting the model & model plot
model: R/03_fit_model.R data/abcd_simulated_data550.csv
	Rscript R/03_fit_model.R 
	
.PHONY: clean
clean:
	rm -f output/* && rm -f report.html 