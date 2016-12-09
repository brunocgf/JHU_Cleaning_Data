---
title: "CodeBook"
author: "Bruno Gonzalez"
date: "December 8, 2016"
---


Feature Selection 
=================

For each signals used to estimate variables of the feature vector for each pattern'-XYZ we have 6 variables (meanX, meanY, meanZ, sdX, sdY, sdY), each one the mean by activity and subject.

-tBodyAcc-XYZ

-tGravityAcc-XYZ

-tBodyAccJerk-XYZ

-tBodyGyro-XYZ

-tBodyGyroJerk-XYZ

-fBodyAcc-XYZ

-fBodyAccJerk-XYZ

-fBodyGyro-XYZ

For the rest of the variables we have two more (mean and sd), each one the mean by activity and subject.

-tBodyAccMag 

-tGravityAccMag

-tBodyAccJerkMag

-tBodyGyroMag

-tBodyGyroJerkMag

-fBodyAccMag

-fBodyAccJerkMag

-fBodyGyroMag

-fBodyGyroJerkMag

-gravityMean

-tBodyAccMean

-tBodyAccJerkMean

-tBodyGyroMean

-tBodyGyroJerkMean

Also there are 3 more variables:

act: the activity id 

act_name: the activity description

sub: the subject