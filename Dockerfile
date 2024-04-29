FROM rocker/r-ubuntu as base

RUN mkdir /final_project

WORKDIR /final_project

RUN mkdir -p renv

COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

FROM rocker/r-ubuntu

WORKDIR /final_project

COPY --from=base /final_project .

ENV WHICH_CONFIG "default"

COPY Makefile Makefile
COPY report.Rmd report.Rmd
COPY render_report.R render_report.R
COPY README.md README.md

RUN mkdir R
RUN mkdir output
RUN mkdir data
RUN mkdir report

COPY data/abcd_simulated_data550.csv data/abcd_simulated_data550.csv
COPY data/ABCD_OTR_DataDictionary_SimulationData.xlsx data/ABCD_OTR_DataDictionary_SimulationData.xlsx 
COPY R/00_load_abcd_data.R R/00_load_abcd_data.R
COPY R/01_make_tables.R R/01_make_tables.R
COPY R/02_make_figures.R R/02_make_figures.R
COPY R/03_fit_model.R R/03_fit_model.R

RUN apt-get update && apt-get install -y pandoc

CMD make && mv report.html report
