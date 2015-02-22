# cleaningdata
Getting and Cleaning data directory project

The purpose of this project is to create one tidy data based on the following source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The tidy data set should contain the average of each variable for each activity and each subject.

In order to achieve this, the following steps were taken:

1. The training and test data sets were merged into one data set.
2. The data containing only the measurements on the mean and standard deviation for each measurement was extracted. 
3. Descriptive activity names were added to name the activities in the data set
4. The labels in the data set were replaced with descriptive variable names. 
5. Mean of each activity was derived for each independent activity and for each subject and label

