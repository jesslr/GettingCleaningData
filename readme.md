# Course Project for Getting and Cleaning Data

## Purpose and project summary
From the coursera website describing the project 
(https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions):

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 
  1. a tidy data set as described below
  2. a link to a Github repository with your script for performing the analysis 
  3. a code book that describes the variables, the data, and any transformations or work 
  	that you performed to clean up the data called CodeBook.md. You should also include 
  	a README.md in the repo with your scripts. This repo explains how all of the scripts 
  	work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced 
algorithms to attract new users. The data linked to from the course website represent data 
collected from the accelerometers from the Samsung Galaxy S smartphone. A full description 
is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following: 

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject 


## Repo contents
This repository contains three items required for the course project:

	* readme.md
	* CodeBook.md
	* run_analysis.R

### README

This file which describes how to run the R script, details on where data should be unzipped and the goals of the assignment.


### Codebook

The Codebook contains:

* A description of each of the variables, including units
* Information about the summary choices
* Information about the experimental study design

### run_analysis.R

This script assumes that the raw data from the _Human Activity Recognition
Using Smartphones_ is downloaded and unzipped in the working directory along
with run_analysis.R.


#### Steps to use run_analysis.R

1. Download the HAR dataset from the link provided above
2. Unzip the dataset to working directory
3. Download run_analysis.R to working directory
4. Execute run_analysis.R. The script utilizes dplyr and reshape2 libraries


#### Script output

Running the script will produce a text file named tidy.txt in the current working directory.  
The tidy dataset is what is produced in step 5 of the project requirements.
