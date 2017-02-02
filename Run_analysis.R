# Download data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "data.zip")
unzip("data.zip")

# Reading test and train data sets (X, y and subject files)

setwd("~/Documents/Data/Run Analysis")
trx <- read.table("UCI HAR Dataset/train/X_train.txt")
try <- read.table("UCI HAR Dataset/train/y_train.txt")
trsub <- read.table("UCI HAR Dataset/train/subject_train.txt")
ttx <- read.table("UCI HAR Dataset/test/X_test.txt")
tty <- read.table("UCI HAR Dataset/test/y_test.txt")
ttsub <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Reading features and activity_labels vectors and changing their class to charater
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features[,2] <- as.character(features[,2])

# Combine train and test files (X, Y, and subject)
Subject <- rbind(trsub,ttsub)
Activity <- rbind(try,tty)
Features <- rbind(trx,ttx)

# Extracts only mean and std of each measurement from Features dataset
mean_std_indicies <- grep(".*mean\\(\\)|.*std\\(\\)", features[,2])
Features <- Features[, mean_std_indicies]
names(Features) <- features[mean_std_indicies,2]

# Using descriptive activity labels to name the Activity dataset
Activity[,1] = activitiy_labels[Activity[,1],2]

# Merging all the three datasets and creating a new combined dataset
names(Activity) <- "ActivityName"
names(Subject) <- "Subject_ID"
mergedata <- cbind(subject, Activity, Features)

# Converting Activity and Subject into factors and creating a new dataset called tidy.txt
mergedata$ActivityName <- factor(mergedata$ActivityName, levels = activity_labels[,1], labels = activity_labels[,2])
mergedata$Subject_ID <- as.factor(mergedata$Subject_ID)
mergedata.melted <- melt(mergeData, id = c("Subject_ID", "ActivityName"))
mergedata.mean <- dcast(merge.melted, Subject_ID + ActivityName ~ variable, mean)

write.table(mergedata.mean, "tidy.txt", row.names = FALSE, quote = FALSE)