## Load Libraries
library(plyr)
library(dplyr)
library(tidyr)
## 1 - Load and Merge test and train data
##setwd("C:\\Users\\Selak\\Dropbox\\Coursera\\02 - Cleaning Data\\Project\\UCI HAR Dataset\\")
activity_lbl <- read.table("activity_labels.txt")
dffeatures <- read.table("features.txt")
full_set <- rbind(read.table("test\\X_test.txt"),read.table("train\\X_train.txt"))
full_lbl <- rbind(read.table("test\\Y_test.txt"),read.table("train\\Y_train.txt"))
full_subject <- rbind(read.table("test\\subject_test.txt"),read.table("train\\subject_train.txt"))
## 4 - Add column names
## vfeatures <- as.character(dffeatures[,2])
dffeatures[,2] <- make.names(dffeatures[,2], unique = TRUE, allow_ = TRUE)
colnames(full_set) <- as.character(dffeatures[,2])
## 2 - Get only columns (names in dffeatures) with keyword mean and std in it.  
## Use tolower() function to include the last 6 columns with Mean
mean_std_data <- full_set[,append(grep(c("mean"),tolower(dffeatures[,2])),grep(c("std"),tolower(dffeatures[,2])))]
## Append Activities to data
full_data <- cbind(full_lbl,full_subject,mean_std_data)
## 3 - append activity description
names(full_data)[1] <- "act_code"
names(full_data)[2] <- "subject"
names(activity_lbl)[1] <- "code"
names(activity_lbl)[2] <- "desc"
desc_full_data <- merge(activity_lbl,full_data,by.y="act_code",by.x="code")
## Creating Groups with ddply functions
vsummary <- ddply(desc_full_data,.(subject,desc), numcolwise(mean))
vsummary <- vsummary[-c(3)]
write.table(vsummary, file = "project.txt", row.names=FALSE)



