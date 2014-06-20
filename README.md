## Getting and Cleaning Data Project
* Unzip the source

  into a folder on your local drive, say C:\Users\yourname\Documents\R\

* Put run_analysis.R to  C:\Users\yourname\Documents\R\UCI HAR Dataset\

* in RStudio: setwd("C:\\\\Users\\\\yourname\\\\Documents\\\\R\\\\UCI HAR Dataset\\\\")

  and then run: 
  1. source("run_analysis.R")
  2. run.analysis(getwd())


* The latter will run the R script, it will read the dataset and write these files:

  1. merged_clean_data.txt

  2. data_set_with_the_averages.txt


* Use data <- read.table("data_set_with_averages.txt").
