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

The above steps were achieved using the script named run_analysis.R.
The script works on the directory ./wdir/projData which needs to be created on the working directory of R. The data needs to be downloaded and placed on this directory then unzipped

The script works as follows:
1. The library dplyr is loaded
2. Files are read into various variables using read.table command. The files included the training data sets, the test data sets, the features and the labels data set
3. The data tables are then merged based on the similarity
4. Columns with means and standard deviations are extracted
5. Activity labels are replaced with desriptive activity names
6. The data is then summarised to get the means of various features grouped by subject and activity labels
7. The final summarised data is written using write.table function with option row.name=FALSE

The code book for the output data ( summarised data), projectSummary.txt is named CodeBook.md 
