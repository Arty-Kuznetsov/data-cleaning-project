#### Human Activity Recognition Using Smartphones Dataset

#####  Background for data collection

The experiments was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##### Project website
[Human Activity Recognition Using Smartphones Data Set]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##### Link to download source data

[UCI HAR Dataset]
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

##### Original dataset files 



The following files are available for the train and test data. 

- `README.txt`

- `features_info.txt`: Shows information about the variables used on the feature vector.

- `features.txt`: List of all features.

- `activity_labels.txt`: Links the class labels with their activity name.

- `train/X_train.txt`: Training set.

- `train/y_train.txt`: Training labels.

- `test/X_test.txt`: Test set.

- `test/y_test.txt`: Test labels.


- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##### Additional files provided by this Coursera project 


The following files have been created as part of the project

- `README.md`: The project readme file, which explains how to run the script in your own environment

- `CodeBook.md`: This file, which gives more information on the dataset and the steps performed on it. 

- `run_analysis.R`: R script used to merge, transform and provide additional analysis of the original UCI HAR Dataset

- `tidydataset.txt`: An exported file which gives average of each variable for each activity and each subject. The variables averaged are only for the means and standard deviations provided in the original dataset.

##### R package requirements
This project work in the `run_analysis.R` mainly use R base packages with the exception of `dplyr` which needs to be installed from CRAN and enabled using the commands `library(dplyr)` or `require(dplyr)`. The latter is used in the script


##### Steps carried out for project analysis in detail 
The following steps are performed after the data files listed above are imported into R data frames using the `read.table()` function in R. 

##### Step 1 : Merging the training and the test sets to create one data set.

First the columns of the test and train datasets are linked together using the function `dplyr::bind_cols`
Second the rows of the test and train datasets are appended to form one dataframe using `rbind` 
##### Step 2 : Extract only the measurements on the mean and standard deviation for each measurement.
First illegal characters in column names are removed using the `make.name` function then the relevant columns are selected using `dplyr::select` to create a new dataframe
##### Step 3 : Use descriptive activity names to name the activities in the data set
The activity labels are imported to R using `read.table` and then merged into the dataset using the `merge` function.
Columns are then reordered so that the labels are not the last column.##### Step 4 : Appropriately labels the data set with descriptive variable names.

Labels of the variable are renamed using the `gsub` function so they are in title case with underscores instead of dots. ##### Step 5 : From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

A list is created of the variable header names required, which are then used by the `aggregate` function to calculate the mean of each column.

Finally the text file `tidydataset.txt` is written out to the file system using the function `write.table`

##### Final export description

The final export consists of a total 180 observations with 6 each for the 30 subject identifiers. There are 48 variables with there means for each activity and subject which are displayed in the appendix below




##### Appendix 

List of labels for the final tidy dataset are displayed below
`Activity_Labels`
`Subjectidentifier`
`Time_Body_Acceleration_Mean_X`
`Time_Body_Acceleration_Mean_Y`
`Time_Body_Acceleration_Mean_Z`
`Time_Gravity_Acceleration_Mean_X`
`Time_Gravity_Acceleration_Mean_Y`
`Time_Gravity_Acceleration_Mean_Z`
`Time_Body_AccelerationJerk_Mean_X`
`Time_Body_AccelerationJerk_Mean_Y`
`Time_Body_AccelerationJerk_Mean_Z`
`Time_Body_Gyro_Mean_X`
`Time_Body_Gyro_Mean_Y`
`Time_Body_Gyro_Mean_Z`
`Time_Body_GyroJerk_Mean_X`
`Time_Body_GyroJerk_Mean_Y`
`Time_Body_GyroJerk_Mean_Z`
`Frequency_Body_Acceleration_Mean_X`
`Frequency_Body_Acceleration_Mean_Y`
`Frequency_Body_Acceleration_Mean_Z`
`Frequency_Body_AccelerationJerk_Mean_X`
`Frequency_Body_AccelerationJerk_Mean_Y`
`Frequency_Body_AccelerationJerk_Mean_Z`
`Frequency_Body_Gyro_Mean_X`
`Frequency_Body_Gyro_Mean_Y`
`Frequency_Body_Gyro_Mean_Z`
`Time_Body_Acceleration_StandardDeviation_X`
`Time_Body_Acceleration_StandardDeviation_Y`
`Time_Body_Acceleration_StandardDeviation_Z`
`Time_Gravity_Acceleration_StandardDeviation_X`
`Time_Gravity_Acceleration_StandardDeviation_Y`
`Time_Gravity_Acceleration_StandardDeviation_Z`
`Time_Body_AccelerationJerk_StandardDeviation_X`
`Time_Body_AccelerationJerk_StandardDeviation_Y`
`Time_Body_AccelerationJerk_StandardDeviation_Z`
`Time_Body_Gyro_StandardDeviation_X`
`Time_Body_Gyro_StandardDeviation_Y`
`Time_Body_Gyro_StandardDeviation_Z`
`Time_Body_GyroJerk_StandardDeviation_X`
`Time_Body_GyroJerk_StandardDeviation_Y`
`Time_Body_GyroJerk_StandardDeviation_Z`
`Frequency_Body_Acceleration_StandardDeviation_X`
`Frequency_Body_Acceleration_StandardDeviation_Y`
`Frequency_Body_Acceleration_StandardDeviation_Z`
`Frequency_Body_AccelerationJerk_StandardDeviation_X`
`Frequency_Body_AccelerationJerk_StandardDeviation_Y`
`Frequency_Body_AccelerationJerk_StandardDeviation_Z`
`Frequency_Body_Gyro_StandardDeviation_X`
`Frequency_Body_Gyro_StandardDeviation_Y`
`Frequency_Body_Gyro_StandardDeviation_Z`

