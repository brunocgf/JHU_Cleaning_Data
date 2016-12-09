----------------------------------------------------------------------------------------------------------------------------------------------
Getting and Cleaning Data Final Project
Bruno César González
----------------------------------------------------------------------------------------------------------------------------------------------

This project starts unploading the files, merging both train and test on a variable called *data*. Headers are added using the file features.txt.

Next, mean and standard deviation are extracted from the original data and put on a new variable *data_ext*. The column names are changed replacing "-" by "_" and eliminating "()", this is beacause the function summarize donesn't admit those symbols.

After that, activity id, activity description subject are added.

Finaly, the date are gruped by activity name and subject. Data are summarized getting the mean by activity and subject on a new variable *data_avg*.
