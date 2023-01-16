================================================================================================================
README.md
Submission for the 'Getting and Cleaning Data Course Project'
Version 1.0
================================================================================================================

The goal of this repository is to work with and process the given data to get the desired output. The exact work steps are explained in more detail below.

The data set was taken from https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and the aforementioned course is https://www.coursera.org/learn/data-cleaning.

The following steps were implemented:
================================================================================

1. Load all files needed for training. Merge files horizontally and add column headers for features.

2. Load all files needed for testing. Merge files horizontally and add column headers for features.

3. Vertically bind dataframes for training and testing.

4. Select features concerning the mean or standard deviation of the given measurements. Discard all other features.

5. Load file for mapping between key and type of activity. Use contents of file to add column containing activity-label. Delete column containing activity-key. 

6. Group data by subject and activity. Calculate mean for every measurement by group.

7. Export data as txt-file.

The script is based on functionalities taken from the following packages:
================================================================================

* tidyr
* dplyr

This repository contains the following files:
================================================================================

* run_analysis.R: script used for transforming the given dataset
* README.md: documentation on how the data is transformed
* CODEBOOK.md: documentation concerning the features of the resulting dataset

================================================================================================================
Version 1.0 submitted on 2022/01/16
================================================================================================================