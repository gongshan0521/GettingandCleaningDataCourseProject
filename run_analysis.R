library(dplyr)

## define the filename for features.txt
FeaturesFileName <- "./FUCI HAR Dataset/UCI HAR Dataset/features.txt"
## read features.txt
features <- read.table(FeaturesFileName, header = FALSE)

## read the raw dataset
## train dataset
traindataFile <- "./FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
trainsubjectFile <- "./FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
trainactivityFile <- "./FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"

## test dataset
testdataFile <- "./FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
testsubjectFile <- "./FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"
testactivityFile <- "./FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"

## merge the original data from test and train set
## group by activity and subject

## read training dataset
traindata <- read.table(traindataFile, header = FALSE)
trainsubject <- read.table(trainsubjectFile, header = FALSE)
trainactivity <- read.table(trainactivityFile, header = FALSE)

## create a dataframe containing all the train data
traindataset <- data.frame(matrix(nrow = nrow(traindata), ncol = (ncol(traindata)+ncol(trainsubject)+ncol(trainactivity))))
names(traindataset) <- c("activity", "subject", as.vector(features[,2]))
traindataset[,1] <- trainactivity[,1]
traindataset[,2] <- trainsubject[,1]
traindataset[,3:563] <- traindata[,]
## sort the data by activity and then subject
traindataset <- traindataset[order(traindataset$activity, traindataset$subject),]

## read test data
testdata <- read.table(testdataFile, header = FALSE)
testsubject <- read.table(testsubjectFile, header = FALSE)
testactivity <- read.table(testactivityFile, header = FALSE)

## create a dataframe containing all the test data
testdataset <- data.frame(matrix(nrow = nrow(testdata), ncol = (ncol(traindata)+ncol(testsubject)+ncol(testactivity))))
names(testdataset) <- c("activity", "subject", as.vector(features[,2]))
testdataset[,1] <- testactivity[,1]
testdataset[,2] <- testsubject[,1]
testdataset[,3:563] <- testdata[,]
## sort the data by activity and then subject
testdataset <- testdataset[order(testdataset$activity, testdataset$subject),]

## merge these two dataset: train and test
rawdataset <- rbind(traindataset, testdataset)
## sort the data by activity and then subject
rawdataset <- rawdataset[order(rawdataset$activity, rawdataset$subject),]

## rawdata file name
## folder to store data set local
dataFolder <- "./FUCI HAR Dataset/UCI HAR Dataset/tidy"
if (!(dir.exists(dataFolder))) {
  dir.create("./FUCI HAR Dataset/UCI HAR Dataset/tidy") 
}
rawdataFile <- "./FUCI HAR Dataset/UCI HAR Dataset/tidy/rawdata.txt"
## write rawdata to local file
write.table(rawdataset, rawdataFile, sep = "\t", row.names = FALSE)


## extracts measurements on the mean and standard deviation for each measurement

## locate the position of mean and standard deviation in the features
featuresList <- grep("mean|std", features[,2])

## select variable from features.txt
variableSet <- as.character(features[featuresList,2])

## select data from 
selectList <- c(1, 2, (featuresList+2))
selectedDataset <- rawdataset[,selectList]

## write selected data to local file
selectedDataFile <- "./FUCI HAR Dataset/UCI HAR Dataset/tidy/selectdata.txt"
write.table(selectedDataset, selectedDataFile, sep = "\t", row.names = FALSE)

## read activity list
activityLabelFile <- "./FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"
activityLabel <- read.table(activityLabelFile, header = FALSE)
## creates tidy data set with the average of each variable for each activity and each subject
studentNum <- 30
activityNum <- 6
tidydata <- data.frame(matrix(nrow = (studentNum*activityNum), ncol = 81))
names(tidydata) <- c("activity", "subject", variableSet)

## subject and activities for data collection
subjectList <- rep(1:studentNum, activityNum)
activityLabelList <- rep(1:activityNum, each = studentNum)
tidydata[,1] <- activityLabelList
tidydata[,2] <- subjectList

for (i in 1:nrow(tidydata)) {
  newdata <- filter(selectedDataset, activity == tidydata[i,1] & subject == tidydata[i,2])
  meanValue <- apply(newdata,2,mean)
  tidydata[i, 3:ncol(tidydata)]  <- meanValue[3:ncol(tidydata)]
}

## replace activity labels with names
tidydata[,1] <- as.character(tidydata[,1])
activityList <- rep(as.character(activityLabel[,2]), each = studentNum)
tidydata[,1] <- activityList

## refine variable names with more desciptive names
## remove brackets
names(tidydata) <- gsub("\\(|\\)", "", names(tidydata))
## remove "-"
names(tidydata) <- gsub("-", "", names(tidydata))
## rename "t" to "timeDomain" and "f" to "frequencyDomain"
for (i in 1:length(names(tidydata))) {
  if (substr(names(tidydata)[i], 1, 1) == "t"){
    names(tidydata)[i] <- paste("timeDomain", substr(names(tidydata)[i], 2, nchar(names(tidydata)[i])), sep = "")
  }
  if (substr(names(tidydata)[i], 1, 1) == "f"){
    names(tidydata)[i] <- paste("frequencyDomain", substr(names(tidydata)[i], 2, nchar(names(tidydata)[i])), sep = "")
  }
}
## rename "mean" to "Mean"
names(tidydata) <- sub("mean", "Mean", names(tidydata))
## rename "std" to "Std"
names(tidydata) <- sub("std", "Std", names(tidydata))
## some of the names have "BodyBody", rename them to "body"
names(tidydata) <- sub("BodyBody", "Body", names(tidydata))

## write tidy data to local file
tidydataFile <- "./FUCI HAR Dataset/UCI HAR Dataset/tidy/tidydata.txt"
write.table(tidydata, tidydataFile, sep = "\t", row.names = FALSE)