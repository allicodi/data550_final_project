#! Rule for rendering the report
report.html: render_report.R report.Rmd all_tables.Rds figures model data/abcd_simulated_data550.csv
	Rscript render_report.R
	
#! Rules for building the tables
all_tables.Rds: R/01_make_tables.R data/abcd_simulated_data550.csv
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