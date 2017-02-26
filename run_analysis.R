# Getting and Cleaning Data Course Project

library(dplyr)

activity <- read.table(".\\UCI HAR Dataset\\activity_labels.txt",sep = " ", col.names = c("activity_number","activity"))
activitylabels <- activity[,2]
activitylevels <- as.numeric(activity[,1])
features <- read.table(".\\UCI HAR Dataset\\features.txt",colClasses = "character")
features <- features[,2]

# Create test dataset.
testdataset <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
testactivitynumbersequence <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
testactivitynumbersequence <- testactivitynumbersequence[,1]
# Descriptive activity names.
testdataset$activity <- factor(testactivitynumbersequence,levels = activitylevels, labels = activitylabels)
testsubjectsequence <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
testsubjectsequence <- testsubjectsequence[,1]
# Add subject numbers to dataset
testdataset$subject <- testsubjectsequence

#Create train dataset.
traindataset <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
trainactivitynumbersequence <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
trainactivitynumbersequence <- trainactivitynumbersequence[,1]
# Descriptive activity names.
traindataset$activity <- factor(trainactivitynumbersequence,levels = activitylevels, labels = activitylabels)
trainsubjectsequence <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
trainsubjectsequence <- trainsubjectsequence[,1]
# Add subject numbers to dataset
traindataset$subject <- trainsubjectsequence

# Create Joint Dataset
jointdataset <- rbind.data.frame(testdataset,traindataset)

# Determine which features correspond to mean and standard deviation of the original measurements.
# It is unclear in the assignment as to which means and std deviations are required.
meanandstdcolumns <- grep("(tBodyAcc|tBodyGyro|tGravityAcc)-(mean|std).*",features)

# Clean up the variable names.
goodvariablenames <- c(features[meanandstdcolumns],"activity","subject")
goodvariablenames <- make.names(goodvariablenames)
goodvariablenames <- gsub("\\.","",goodvariablenames)
# Add the subject and activity columns to the column indices vector that we are going to use to extract
# from the joint dataset. Note that the "subject" and "activity" columns are at the end of the dataset.
meanandstdcolumns <- c(meanandstdcolumns,ncol(jointdataset) - 1,ncol(jointdataset))

# Filter out the columns that we want.
filtereddataset <- jointdataset[,meanandstdcolumns]
#Provide good variable names.
colnames(filtereddataset) <- goodvariablenames

# Convert to tbl_data for convenient operation.
filteredtable <- tbl_df(filtereddataset)

# Split the dataset into subject specific data.
listsplitbysubjects <- split(filteredtable,filteredtable$subject)

# This function groups subject specific data into activity specific data
# and then calculate the means(average) per activity.
summarizefun <- function(x)
{
  means <- summarize_each(group_by(x,activity),funs(mean))
  # Refer http://stackoverflow.com/a/25839767
}

# Calculate the average metrics for all subjects.
avgdataset <- lapply(listsplitbysubjects, FUN = summarizefun)

# Data mangling to get all data into a single data frame.
# Convert list of data frames to single data frame conversion.
# Do some cleanup and rearranging of columns.
# Ref http://stackoverflow.com/a/5187897
haraverages <- do.call("rbind",avgdataset)
# Clean up row names.
rownames(haraverages) <- c()
# Rearrange columns and clean column names.
haraverages <- cbind(subject = haraverages$subject,select(haraverages,-subject))
columnnames <- colnames(haraverages)
goodcolnames <- c("subject","activity",paste("avg",columnnames[3:length(columnnames)],sep=""))
colnames(haraverages) <- goodcolnames

write.table(haraverages,file = "haraverages.txt", row.name = FALSE)
