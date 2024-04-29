# DATA 550 Final Project Description
## Allison Codi

This repository contains code to conduct analyses for the AntiBiotics for Children with Diarrhea (ABCD) clinical trial. 

The repository has been broken into the following subfolders:

- `data/` contains the simulated ABCD dataset and a data dictionary for the dataset
	- `abcd_simulated_data550.csv` is the dataset and will be loaded through the R scripts to conduct analyses
	- `ABCD_OTR_Data Dictionary_SimulationData.xlsx` is a data dictionary for the simulated dataset for user reference (not needed by any scripts in repository)
	
- `R/` contains all necessary scripts to create the tables, figures, and models
	- `00_load_abcd_data.R` is run first to load and format the data. It is sourced by the other R scripts. 
	- `01_make_tables.R` is run second to create relevant tables describing the dataset
	- `02_make_figures.R` is run third to create figures for the single pathogen quantities
	- `03_fit_model.R` is run fourth to fit the model and create a figure corresponding to the model
	
- `output/` contains all relevant output produced from the R scripts to be knit into the final report 

- `final_report/` contains the final report when generated in the Docker container. This folder is mounted in the Docker container. 
	
- `report.Rmd` is the Markdown document that knits together the figures and tables into the final report

- `render_report.R` renders the final R Markdown report from the command line

- `Makefile` can be used to build the final report. The following commands can be used to interact with the Makefile
  - Report Rules - The following rules can be used to make the report locally without the use of Docker
	- `make install` will use the `renv::restore` command to synchronize the package environment using the `renv.lock` file
	- `make` will build the final html report from scratch. It calls individual rules for making the tables, figures, and model. Run this command after ensuring the package environment is synchronized. The final report will be created and placed into the main project directory if making the report locally using this command. 
  - Docker Rules - The following rules can be used to build a Docker image, make the report within the Docker container, and retrieve the report locally
  	- `make final_project_image` will build the Docker image
  	- `make final_report/report.html` will build the report automatically in the Docker container
  - Additional Rules
	- `make clean` will clean up the project folder, removing the html report and output used in the report

## Using Docker to Generate Report

### Docker Build (optional)
 If you would like to build an image for the report from scratch, use the command `make final_project_image`

### Build report in Docker container

Run `make final_report/report.html` to build the report using [`allicodi/final_project_image`](https://hub.docker.com/repository/docker/allicodi/final_project_image). The final html report can be retrieved from the `final_report/` folder.