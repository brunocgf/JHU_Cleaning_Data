# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that
# can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required
# to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code
# book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You
# should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit,
# Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website
# represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the
# data was obtained:

#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.

library(dplyr)
setwd("C:/Users/Bruno Gonzalez/16 DS_JHU Cleaning_Data")

if(!file.exists("Dataset.zip")){
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./Dataset.zip")
unzip("Dataset.zip")
}

data <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
temp <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
head <- read.table("./UCI HAR Dataset/features.txt", sep="", header = FALSE)
data <- rbind(data, temp)
names(data) <- head[,2]
rm(temp)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

ext <- grep("mean|std", head[,2])
data_ext <- data[ext]

head_ext <- names(data_ext)
head_ext <- gsub("()", "", head_ext)
head_ext <- gsub("-", "_", head_ext)

names(data_ext) <- head_ext

# 3. Uses descriptive activity names to name the activities in the data set


act <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
temp <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
act <- rbind(act, temp)
rm(temp)

data_ext$act <- act$V1

sub <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
temp <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
sub <- rbind(sub, temp)
rm(temp)

data_ext$sub <- sub$V1

# 4. Appropriately labels the data set with descriptive variable names.

act_lab <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
names(act_lab) <- c("id", "act_name")

data_ext <- merge(data_ext, act_lab, by.x = "act", by.y = "id", all = TRUE)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each
# subject

data_ext <- group_by(data_ext, act_name, sub)
mean_names <- names(data_ext)
mean_names <- mean_names[2:80]

data_avg <- summarize(data_ext, mean(tBodyAcc_mean_X),	mean(tBodyAcc_mean_Y), mean(tBodyAcc_mean_Z),	mean(tBodyAcc_std_X),
                      mean(tBodyAcc_std_Y),	mean(tBodyAcc_std_Z), mean(tGravityAcc_mean_X),	mean(tGravityAcc_mean_Y),
                      mean(tGravityAcc_mean_Z),	mean(tGravityAcc_std_X),  mean(tGravityAcc_std_Y),	mean(tGravityAcc_std_Z),
                      mean(tBodyAccJerk_mean_X),	mean(tBodyAccJerk_mean_Y),  mean(tBodyAccJerk_mean_Z),	mean(tBodyAccJerk_std_X),
                      mean(tBodyAccJerk_std_Y),	mean(tBodyAccJerk_std_Z),  mean(tBodyGyro_mean_X),	mean(tBodyGyro_mean_Y),
                      mean(tBodyGyro_mean_Z),	mean(tBodyGyro_std_X),  mean(tBodyGyro_std_Y),	mean(tBodyGyro_std_Z),
                      mean(tBodyGyroJerk_mean_X),	mean(tBodyGyroJerk_mean_Y),  mean(tBodyGyroJerk_mean_Z),	mean(tBodyGyroJerk_std_X),
                      mean(tBodyGyroJerk_std_Y),	mean(tBodyGyroJerk_std_Z),  mean(tBodyAccMag_mean),	mean(tBodyAccMag_std),
                      mean(tGravityAccMag_mean),	mean(tGravityAccMag_std), mean(tBodyAccJerkMag_mean),	mean(tBodyAccJerkMag_std),
                      mean(tBodyGyroMag_mean),	mean(tBodyGyroMag_std), mean(tBodyGyroJerkMag_mean),	mean(tBodyGyroJerkMag_std),
                      mean(fBodyAcc_mean_X),	mean(fBodyAcc_mean_Y),  mean(fBodyAcc_mean_Z),	mean(fBodyAcc_std_X),
                      mean(fBodyAcc_std_Y),	mean(fBodyAcc_std_Z), mean(fBodyAcc_meanFreq_X),	mean(fBodyAcc_meanFreq_Y),
                      mean(fBodyAcc_meanFreq_Z),	mean(fBodyAccJerk_mean_X), mean(fBodyAccJerk_mean_Y),	mean(fBodyAccJerk_mean_Z),
                      mean(fBodyAccJerk_std_X),	mean(fBodyAccJerk_std_Y), mean(fBodyAccJerk_std_Z),	mean(fBodyAccJerk_meanFreq_X),
                      mean(fBodyAccJerk_meanFreq_Y),	mean(fBodyAccJerk_meanFreq_Z), mean(fBodyGyro_mean_X),	mean(fBodyGyro_mean_Y),
                      mean(fBodyGyro_mean_Z),	mean(fBodyGyro_std_X), mean(fBodyGyro_std_Y),	mean(fBodyGyro_std_Z),
                      mean(fBodyGyro_meanFreq_X),	mean(fBodyGyro_meanFreq_Y), mean(fBodyGyro_meanFreq_Z),	mean(fBodyAccMag_mean),
                      mean(fBodyAccMag_std),	mean(fBodyAccMag_meanFreq), mean(fBodyBodyAccJerkMag_mean),	mean(fBodyBodyAccJerkMag_std),
                      mean(fBodyBodyAccJerkMag_meanFreq),	mean(fBodyBodyGyroMag_mean),  mean(fBodyBodyGyroMag_std),	mean(fBodyBodyGyroMag_meanFreq),
                      mean(fBodyBodyGyroJerkMag_mean),	mean(fBodyBodyGyroJerkMag_std),  mean(fBodyBodyGyroJerkMag_meanFreq)
                      )

write.table(data_avg, file="Tydi_data.txt", row.names = FALSE)
