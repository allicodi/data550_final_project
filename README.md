# DATA 550 Final Project Description
## Allison Codi

This repository contains code to conduct analyses for the AntiBiotics for Children with Diarrhea (ABCD) clinical trial. 

The repository has been broken into the following subfolders:

- `data/` contains the simulated ABCD dataset and a data dictionary for the dataset
	- `abcd_simulated_data550.csv` is the dataset and will be loaded through the R scripts to conduct analyses
	- `ABCD_OTR_Data Dictionary_SimulationData.xlsx` is a data dictionary for the simulated dataset
	
- `R/` contains all necessary scripts to create the tables, figures, and models
	- `00_load_abcd_data.R` is run first to load and format the data
	- `01_make_tables.R` is run second to create relevant tables describing the dataset
	- `02_make_figures.R` is run third to create figures for the single pathogen quantities
	- `03_fit_model.R` is run fourth to fit the model and create a figure corresponding to the model
	
- `output/` contains all relevant output produced from the R scripts to be knit into the final report
	
- `report.Rmd` is the Markdown document that knits together the figures and tables into the final report

- `render_report.R` renders the final R Markdown report
		