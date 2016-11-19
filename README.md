# Data-cleaning-project

Coursera Getting and Cleaning Data project


##### Source data
The source data used for the project is provided by UC Irvine Center for Machine Learning and Intelligent Systems from their Machine Learning Repository and is a publicly available dataset used to study Human Activity Recoginition

[Human Activity Recognition Using Smartphones Data Set]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data was provided in a zip file by Coursera available on the following link 

[UCI HAR Dataset]
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

More specific details of the files in the zip together with the transformations performed are outlined in the following markdown file also provided in this repository
[Code Book]
(CodeBook.md)

##### Project requirements
The requirements for the project assigment were as follows
1. Merges the training and the test sets to create one data set.2. Extracts only the measurements on the mean and standard deviation for each measurement.3. Uses descriptive activity names to name the activities in the data set4. Appropriately labels the data set with descriptive variable names.5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Detailed information regarding how each step was carried out are covered in the [Code Book]
(CodeBook.md)

##### Script file
The script file to run to transform the data is called `run_analysis.R` and is located in the same folder as this readme.md file. 

##### Running the script 
Here are the following steps if you wish to run the script

1. Clone the repo from Github.

`git clone git@github.com:johnost/data-cleaning-project.git`
 
2. Download the dataset `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
` 
3. Unzip inside the downloaded file inside the cloned project root level directory. Please do not rename the folder from `UCI HAR Dataset`

4. Open `run_analysis.R` in R Studio IDE

5. Update the `setwd()` function to match your environment and the location of the git repo clone.

6. Run line by line or Run All 

6. An export file called `tidydataset.txt` is placed in the root folder of the cloned project.

##### Importing the final tidy data file for verification

To import the final tidy data txt file please use the following command in R 

``` importtidy <- read.table(file="tidydataset.txt", header = TRUE) ```

