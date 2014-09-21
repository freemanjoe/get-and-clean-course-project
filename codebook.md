JHU Getting and Cleaning Data Course Project
============================================

## The run_analysis.R will perform a series of clean and process actions on Getting and Cleaning Data Course Project provided UCI HAR Dataset, link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## You could obtain information about the dataset from the README.TXT in the zip file.

## The run_analysis.R will ask you to choose proper files for loading and processing, and finally choose where and name for outputing the required tidy dataset. It is advised to set work folder to where the UCI HAR Dataset files is located. Check comments in R scripts for information. Tested OK on Windows 8.1-64bit, R 3.1.1 32-bit, and RStudio Version 0.98.507.

## "subject_number" and "activity_type" are new variables added. The former is the number of the test subjects, and the latter is a descriptive string for one of the six activity type.

## The output file is using default settings of write.table function. It will contain the average of each variable for each activity and each subject.