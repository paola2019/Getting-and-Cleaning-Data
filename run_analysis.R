library(dplyr)

# 1. Download data
urlf <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipf <- "Coursera_DS3_Final.zip"
download.file(urlf, zipf)
unzip(zipf) 

# 2. Create data frames
features <- read.table("UCI HAR Dataset/features.txt", 
                       col.names = c("n","signals"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         col.names = c("id", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$signals)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                     col.names = "id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                      col.names = features$signals)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                      col.names = "id")

# 3. Merge training and the test sets 
xmrg <- rbind(x_train, x_test)
ymrg <- rbind(y_train, y_test)
smrg <- rbind(subject_train, subject_test)
sdata <- cbind(smrg, xmrg, ymrg)

# 4. Extract only the measurements on the mean and 
# standard deviation for each measurement

fdata <- sdata %>% select("subject", "id", contains("mean"), contains("std"))

# 5. Use descriptive activity names to activities in the data set
fdata$"id"[fdata$"id" == 1] <- "Walking"
fdata$"id"[fdata$"id" == 2] <- "Walking_upstairs"
fdata$"id"[fdata$"id" == 3] <- "Walking_downstairs"
fdata$"id"[fdata$"id" == 4] <- "Sitting"
fdata$"id"[fdata$"id" == 5] <- "Standing"
fdata$"id"[fdata$"id" == 6] <- "Laying"

# 6. Appropriately labels the data set with descriptive variable names
names(fdata)[2] = "Activity"
names(fdata)<-gsub("Acc", "Accelerometer", names(fdata))
names(fdata)<-gsub("Gyro", "Gyroscope", names(fdata))
names(fdata)<-gsub("Mag", "Magnitude", names(fdata))
names(fdata)<-gsub("^t", "Time", names(fdata))
names(fdata)<-gsub("^f", "Frequency", names(fdata))
names(fdata)<-gsub("tBody", "TimeBody", names(fdata))
names(fdata)<-gsub("-freq()", "Frequency", names(fdata), ignore.case = T)
names(fdata)<-gsub("angle", "Angle", names(fdata))
names(fdata)<-gsub("gravity", "Gravity", names(fdata))

# 7. Create a second tidy data set with the average of each variable for
# each activity and each subject

fdata2 <- fdata %>% group_by(subject, Activity) %>% 
                summarise_all(funs(mean))
write.table(fdata2, "TidyData2.txt", row.name=FALSE)

