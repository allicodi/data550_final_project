# ------ REPORT ASSOCIATED RULES (run within the container) ------- 

# Rule for rendering the report (runs all other rules)
report.html: render_report.R report.Rmd all_tables.Rds figures model data/abcd_simulated_data550.csv all_tables.Rds figures model
	Rscript render_report.R

# Rules for building the tables
all_tables.Rds: R/01_make_tables.R data/abcd_simulated_data550.csv
	Rscript R/01_make_tables.R

# Rule for building the figures
figures: R/02_make_figures.R data/abcd_simulated_data550.csv
	Rscript R/02_make_figures.R

# Rule for fitting the model & model plot
model: R/03_fit_model.R data/abcd_simulated_data550.csv
	Rscript R/03_fit_model.R

# Rule for syncing environment
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

# Rule to clean up output
.PHONY: clean
clean:
	rm -f output/* && rm -f report.html && rm -f final_report/report.html
	
# ------- DOCKER ASSOCIARED RULES (run locally) -------

PROJECTFILES = report.Rmd R/00_load_abcd_data.R R/01_make_tables.R R/02_make_figures.R R/03_fit_model.R
RENVFILES = renv.lock renv/activate.R renv/settings.json

# rule to build image
final_project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t final_project_image .
	touch $@
	
# rule to build the report automatically in our container 
final_report/report.html:
	docker run -v "/$$(pwd)/final_report":/final_project/report allicodi/final_project_image:latest
	
	