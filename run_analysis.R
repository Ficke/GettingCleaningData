#Adam Ficke 
#Getting and Cleaning Data 
#Week 4 Course Project 

require("data.table")
require("dtplyr")
require("dplyr")
require("tidyverse")

# Download Data
file_check <- "Coursera_DS3_Final.zip"

if (!file.exists(file_check)){
        link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(link, data_file, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
        unzip(data_file) 
}

#Load in features and activities 
features <- read_delim("UCI HAR Dataset/features.txt", delim = " ",col_names = c("n","measurements"))
activity <- read_delim("UCI HAR Dataset/activity_labels.txt",delim = " ", col_names = c("act_code", "activity"))

#load train data 
subject_train <- read_delim("UCI HAR Dataset/train/subject_train.txt",delim = " ", col_names = "subject",col_types = cols(.default = "n"))
x_train <- read_delim("UCI HAR Dataset/train/X_train.txt",delim = " ", col_names = features$measurements,col_types = cols(.default = "n"))
y_train <- read_delim("UCI HAR Dataset/train/y_train.txt",delim = " ", col_names = "act_code",col_types = cols(.default = "n"))
train <- bind_cols(subject_train,y_train,x_train)
train$indicator <- 0

#load test data 
subject_test <- read_delim("UCI HAR Dataset/test/subject_test.txt",delim = " ", col_names = "subject",col_types = cols(.default = "n"))
x_test <- read_delim("UCI HAR Dataset/test/X_test.txt", delim = " ",col_names = features$measurements,col_types = cols(.default = "n"))
y_test <- read_delim("UCI HAR Dataset/test/y_test.txt", delim = " ",col_names = "act_code",col_types = cols(.default = "n"))
test <- bind_cols(subject_test,y_test,x_test)
test$indicator <- 1

#Merge Train and Test 
full_data <- bind_rows(test,train)

#subset to mean and std dev 
full_MS <- full_data %>% 
        select(subject, act_code, contains("mean()"), contains("std()"))

#relabel activities, add in to new column #this didn't work - it ended up retaining the reference tot he entire activities tbl
#full_MS$Activities <- activity[full_MS$act_code,][2]
#replace activity number with label using left join, relocate to beginning, and remove act_code 
full_MS <- left_join(full_MS,activity,by=c("act_code"="act_code")) %>% 
        relocate(activity, .before = act_code) %>% 
        select(-act_code)

#change column names to be more readable 
old_names <- c("Acc","Gyro","Mag","^t","^f","tBody","-mean()","-std()","-freq()","angle","gravity")
new_names <- c("Accelerometer","Gyroscope","Magnitude","Time","Frequency","TimeBody","Mean","StdDev","Frequency","Angle","Gravity")

names(full_MS) <- stringi::stri_replace_all_regex(names(full_MS), old_names, new_names, vectorize_all = FALSE)
names(full_MS)

#Create TidyData set with averages of each variable for each activity and each subject.
TidyDataSet <- full_MS %>%
        group_by(subject,activity) %>%
        summarise_all(list(mean = mean))

head(TidyDataSet)
write.table(TidyDataSet, file = "TidyDataSet.txt",row.names = FALSE)

write_delim(TidyDataSet, delim = ",", file = "TidyDataSet.txt")
TidyDataSet

names(TidyDataSet)

df <- data.frame(old_names,new_names)
df
