#Code Book

##Data Source
The data come from the UCI Machine Learning Repository. You can learn more about the data
set here:
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Variables

###The "features_info.txt" from the UCI data describes their variables as such:
"The features selected for this database come from the accelerometer and gyroscope 3-axial
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time)
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth
filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag,
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

###Final data as transformed by script
The following variables represent the * * mean* *  of variables of the same name from the UCI
dataset. Each mean was calculated per "subject" and "activity", which are the two left columns
of the final data set.

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)

##Data Transformations
The "run_analysis.R" script ran all the necessary transforms to create the final data set.

**You will need to modify the script to set your own working directory.** 

###The script:
1. Sets the working directory
2. Downloads and unzips the UCI data files if that has not already been done
3. Reads the appropriate data from the unzipped files
4. Sets the column names for the data
5. Removes non-mean and non-standard deviation data
6. Merges the data into a single dataframe
7. Transforms the data variables into means per subject and activity type
8. Writes the final data into a text file
