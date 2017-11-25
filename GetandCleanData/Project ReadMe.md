READ ME
How the run_analysis.R script works:

Uses the UC Irvine Human Activity Recognition Using Smartphones Data Set, which can be read about here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Downloads the data from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Reads data from the TEST and TRAINING folders, as well as, feature and activity labels into tables. 
Combines the columns into larger data frames and assigns labels.
Merges both TEST and TRAINING data into a single data set (by row).

Uses a GREP to extract only measurements on the mean and standard deviation for each measurement.
 
Applies descriptive activity names to name the activities in the data set

Enhances data labels to expand abbreviations and appropriately label the data set with descriptive variable names. 

Uses a write.table command to output a data set with the average of each variable for each activity and each subject as tidydata.txt.

