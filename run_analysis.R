library(reshape2)

setwd("r_spec/cleaning_data/course_project")

## if data zip file does not exist, download file
if(!file.exists("HA.zip")){
    time = Sys.time() # log system time
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile = "HA.zip", method = "curl")
}

## if zip file is not unizipped, unzip it
if (!file.exists("UCI HAR Dataset")) { 
    unzip("HA.zip") 
}

## read data
activity <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

## set column names for the intial data
colnames(activity)  = c("activityID","activity")

colnames(subjectTrain)  = "subject"
colnames(xTrain) = features[,2]
colnames(yTrain) = "activityID"

colnames(subjectTest)  = "subject"
colnames(xTest) = features[,2]
colnames(yTest) = "activityID"

## stitch data together
trainFrame <- cbind(subjectTrain, yTrain, xTrain)
testFrame <- cbind(subjectTest, yTest, xTest)
fullFrame <- rbind(trainFrame, testFrame)

# select only the "subject", "activityID", and columns having to do with the mean or standard deviation
fullFrameFinal <- fullFrame[, grepl("subject", colnames(fullFrame)) | grepl("activityID", colnames(fullFrame)) | grepl("mean", colnames(fullFrame)) | grepl("Mean", colnames(fullFrame)) | grepl("std", colnames(fullFrame))]

# merge the data with the activity types by "activityID"
fullFrameFinal <- merge(fullFrameFinal, activity, by="activityID", all.x=TRUE)

# remove the "activityID" column (and reorder the columns neatly 'cus why not?)
fullFrameFinal <- fullFrameFinal[,c(2,89,3:88)]

# reshape the data to get the mean of each variable per subject and activity
final <- melt(fullFrameFinal, id=c(1:2), measure.vars=c(3:87))
final <- dcast(final, subject + activity ~ variable, mean)

# remove the junk (bam!)
rm(subjectTrain, xTrain, yTrain, subjectTest, xTest, yTest, trainFrame, testFrame, fullFrame, activity, features, fullFrameFinal)

# write final data into a CSV
write.table(final, file = "tidy.txt", row.names = FALSE)
