### Getting and Cleaning Data - Course project - John Ost

#### Preparatory and importing 

## Install dependancies
require(dplyr)

## Set Working Directory
## To run this script on another computer this must be updated to match the local environment
setwd("/Volumes/Hard-Disk-Data/Users/jost/Desktop/CleaningData/project/data-cleaning-project/")

## Import individual files into data frames
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testXtest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
testYtest <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
trainXtrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainYtrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)

## Import features file for Column names 
featuresHeader <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

## Set column names for X datasets
colnames(testXtest) <- featuresHeader$V2
colnames(trainXtrain) <- featuresHeader$V2

## Set column names for other data frames
colnames(testSubject) <- "SubjectIdentifier"
colnames(trainSubject) <- "SubjectIdentifier"
colnames(testYtest) <- "actId"
colnames(trainYtrain) <- "actId"

#### Step 1

## Append test data frames together
testset <- bind_cols(testSubject,testYtest,testXtest)

## Append train data frames together
trainset <- bind_cols(trainSubject,trainYtrain,trainXtrain)

## Bind rows of test and train datasets together
fullDataset <- rbind(testset,trainset)

#### Step 2

## Remove illegal characters from column names
newColumnNames <- make.names(names=names(fullDataset), unique=TRUE, allow_ = TRUE)
names(fullDataset) <- newColumnNames
newNames <- data.frame(names(fullDataset))

## Select mean and standard deviation columns
meansStds <- bind_cols(select(fullDataset, contains("SubjectIdentifier")),select(fullDataset, contains("actID")),select(fullDataset, contains("mean...")),select(fullDataset, contains("std...")))

#### Step 3

## Import activity labels 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
names(activityLabels) <- c("actId", "Activity_Labels")
fullDatasetActivities <- merge(meansStds,activityLabels,by="actId" ,all = TRUE)
## reorder columns 
activityLabelsTemp <- select(fullDatasetActivities, Activity_Labels )
tempDataset <- select(fullDatasetActivities, -actId, -Activity_Labels )
finalDataset <- bind_cols(activityLabelsTemp,tempDataset)

#### Step 4

## Rename column names to be descriptive
headerNames <- gsub("tBody","Time_Body_",names(finalDataset))
headerNames <- gsub("tGravity","Time_Gravity_",headerNames)
headerNames <- gsub("fBody","Frequency_Body_",headerNames)
headerNames <- gsub(".mean...","_Mean_",headerNames)
headerNames <- gsub(".std...","_StandardDeviation_",headerNames)
headerNames <- gsub("Acc","Acceleration",headerNames)
names(finalDataset) <- headerNames


#### Step 5 

## Create a list of columns to average minus the Activity_Label and SubjectIdentifier columns
listforAverage <- headerNames[-c(1, 2)]

## Aggregate the finalDataset by Activity_Label and SubjectIdentifier and generate the mean for each of the measured variables 
tidyDataset <- aggregate(finalDataset[,c(listforAverage)], by=list(Activity_Labels=finalDataset$Activity_Labels, Subjectidentifier=finalDataset$SubjectIdentifier ), FUN=mean)

## Export the final tidy dataset 
write.table(tidyDataset, file="tidydataset.txt", row.names=FALSE)



## Example to test the import of the tidydataset.txt file
## 
##     importtidy <- read.table(file="tidydataset.txt", header = TRUE) 
##
##
