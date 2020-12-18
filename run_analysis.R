#Adam Ficke 
#Getting and Cleaning Data 
#Week 4 Course Project 

require("data.table")
require("dtplyr")
require("dplyr")
require("tidyverse")

# Download Data
data_file <- "Coursera_DS3_Final.zip"

if (!file.exists(data_file)){
        link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(link, data_file, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
        unzip(data_file) 
}


#Load in features and activities 
features <- read_delim("UCI HAR Dataset/features.txt", delim = " ",col_names = c("n","functions"))
activity <- read_delim("UCI HAR Dataset/activity_labels.txt",delim = " ", col_names = c("code", "activity"))

#load test data 
subject_test <- read_delim("UCI HAR Dataset/test/subject_test.txt",delim = " ", col_names = "subject")
x_test <- read_delim("UCI HAR Dataset/test/X_test.txt", delim = " ",col_names = features$functions)
y_test <- read_delim("UCI HAR Dataset/test/y_test.txt", delim = " ",col_names = "code")

#load train data 
subject_train <- read_table("UCI HAR Dataset/train/subject_train.txt",delim = " ", col_names = "subject")
x_train <- read_table("UCI HAR Dataset/train/X_train.txt",delim = " ", col_names = features$functions)
y_train <- read_table("UCI HAR Dataset/train/y_train.txt",delim = " ", col_names = "code")

train <- read.csv()
