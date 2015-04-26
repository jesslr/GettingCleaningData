# Coursera course project (Getting and Cleaning Data).  The project should accomplish the following:
#   1.  Merges the training and the test sets to create one data set.
#   2.  Extracts only the measurements on the mean and standard deviation for each measurement.
#   3.  Uses descriptive activity names to name the activities in the data set
#   4.  Appropriately labels the data set with descriptive variable names.
#   5.  From the data set in step 4, creates a second, independent tidy data set with the 
#       average of each variable for each activity and each subject.

library(dplyr)
library(reshape2)

# Using function below to add .mean on column names of final dataset to ensure more descriptive names
# In looking at how to add a suffix to variable names, I found the following function.
# It can be found in the github repo at https://github.com/amalherbe/Getting-and-Cleaning-Data/blob/master/run_analysis.R

#Utils: function add suffix
addSuffix<- function(x, suffix) {
    if (!(x %in% c("Subject","Activity"))) {
        paste(x,suffix, sep="")
    }
    else{
        x
    }
}

# assumes that the file was unzipped to the home directory
path  <- file.path("./", "UCI HAR Dataset")
files <- list.files(path, recursive=TRUE)

# The following section accomplishes task #1 for the project
# 1.  Merges the training and the test sets to create one data set.

# read in activity, subject and features files for test and train datasets
activityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ), header = FALSE)
activityTrain <- read.table(file.path(path, "train", "Y_train.txt"), header = FALSE)

subjectTrain <- read.table(file.path(path, "train", "subject_train.txt"), header = FALSE)
subjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"), header = FALSE)

featuresTest  <- read.table(file.path(path, "test" , "X_test.txt" ), header = FALSE)
featuresTrain <- read.table(file.path(path, "train", "X_train.txt"), header = FALSE)

# read in activity labels
activityLabels <- read.table(file.path(path, "activity_labels.txt"), header = FALSE)

# read in features
featureNames <- read.table(file.path(path, "features.txt"), header = FALSE)

# combine train and test datasets for subject, activity and features
subjectCombined  <- rbind(subjectTrain, subjectTest)
activityCombined <- rbind(activityTrain, activityTest)
featuresCombined <- rbind(featuresTrain, featuresTest)

# The following section accomplishes task #3 for the project
# 3.  Uses descriptive activity names to name the activities in the data set

# label the 561 elements with descriptive names
colnames(featuresCombined) <- t(featureNames[,2])

# label columns of activity and subject
colnames(activityCombined) <- "Activity"
colnames(subjectCombined) <- "Subject"

# create a complete data set using cbind to bind columns together
compData <- cbind(featuresCombined, activityCombined, subjectCombined)

# The following section accomplishes task #2 for the project
# 2.  Extracts only the measurements on the mean and standard deviation for each measurement.

# get all column names needed for subset - those containing mean() or std()
columns <- grep("mean\\(\\)|std\\(\\)", names(compData), ignore.case=TRUE)

# add subject and activity
columns <- c(563, 562, columns)

# create subset of dataset using the column positions in column variable
subsetData <- compData[,columns]

# The following section accomplishes task #4 for the project
# 4.  Appropriately labels the data set with descriptive variable names.

# label activities values
subsetData$Activity <- factor(subsetData$Activity, labels=activityLabels[,2])

# The following section accomplishes task #4 for the project
# 5.  From the data set in step 4, creates a second, independent tidy data set with the 
#     average of each variable for each activity and each subject.

# create the tidy data set
meltData <- melt(subsetData, id = c("Subject", "Activity"))
tidyData <- dcast(meltData, Subject+Activity ~ variable, mean)

#improve column names
colNames <- names(tidyData)
colNames <- sapply(colNames, addSuffix, ".mean")
names(tidyData) <- colNames

# write the tidy data set to a file
write.table(tidyData, "./tidy.txt", row.names=FALSE)
