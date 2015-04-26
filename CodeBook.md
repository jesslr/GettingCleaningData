# Codebook  
## Getting and Cleaning Data Course Project 

This code book describes the variables, the data, and any transformations or work that was
performed to clean up the data.  This project uses data from the Human Activity Recognition 
Using Smartphones Dataset, Version 1.0

Citation Request:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, 
Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

For more information about this dataset contact: activityrecognition@smartlab.ws

## Original Data

#### Data Set Information 
(from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the training data 
and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter 
with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain.

#### Included Files

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Notes

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


#### Attribute Information

For each record it is provided (from readme.txt provided with data):

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

#### Feature Vector 

The following is documented in the features_info.txt provided in the zipped data:

The features selected for this database come from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a 
corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Data Transformation

### Project Goals:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the 
average of each variable for each activity and each subject.

#### Merge test and train datasets  
The R script reads in activity, subject and features files for test and train datasets: 

```
activityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ), header = FALSE)
activityTrain <- read.table(file.path(path, "train", "Y_train.txt"), header = FALSE)

subjectTrain <- read.table(file.path(path, "train", "subject_train.txt"), header = FALSE)
subjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"), header = FALSE)

featuresTest  <- read.table(file.path(path, "test" , "X_test.txt" ), header = FALSE)
featuresTrain <- read.table(file.path(path, "train", "X_train.txt"), header = FALSE)
```

Then, it creates combined datasets for test and train by subject, activity, and features:

```
subjectCombined  <- rbind(subjectTrain, subjectTest)
activityCombined <- rbind(activityTrain, activityTest)
featuresCombined <- rbind(featuresTrain, featuresTest)
```

We also read in files containing labels for activity and feature variables:

```
activityLabels <- read.table(file.path(path, "activity_labels.txt"), header = FALSE)
featureNames <- read.table(file.path(path, "features.txt"), header = FALSE)
```

#### Label activities and dataset with descriptive variable names

Uses descriptive activity names to name the activities in the data set:

```
# label the 561 elements with descriptive names
colnames(featuresCombined) <- t(featureNames[,2])

# label columns of activity and subject
colnames(activityCombined) <- "Activity"
colnames(subjectCombined) <- "Subject"
```

#### Create one data set with test and train and all columns

```
compData <- cbind(featuresCombined, activityCombined, subjectCombined)
```

#### Extract the measurements on the mean and standard deviation for each measurement

Using grep, I look for only measurements with mean() or std()

```
# get all column names needed for subset - those containing mean() or std()
columns <- grep("mean\\(\\)|std\\(\\)", names(compData), ignore.case=TRUE)

# add subject and activity
columns <- c(563, 562, columns)

# create subset of dataset using the column positions in column variable
subsetData <- compData[,columns]
```

#### Label activities values

```
subsetData$Activity <- factor(subsetData$Activity, labels=activityLabels[,2])
```


#### Create second, independent tidy data set with the average of each variable for each activity and each subject.

Also, I add .mean to the necessary variable names to make it clear these are averages

```
# create the tidy data set
meltData <- melt(subsetData, id = c("Subject", "Activity"))
tidyData <- dcast(meltData, Subject+Activity ~ variable, mean)

#improve column names
colNames <- names(tidyData)
colNames <- sapply(colNames, addSuffix, ".mean")
names(tidyData) <- colNames

# write the tidy data set to a file
write.table(tidyData, "./tidy.txt", row.names=FALSE)
```



