#### Getting and Cleaning Data - Peer assessment project

####  *run_analysis.R* prepares the data as required by the assessment as follows:

1. Downloads the data sets.
2. Creates eight data frames.
3. Merges the training and the test sets to create one data set.
4.  Extracts only the measurements on the mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set.
6. Appropriately labels the data set with descriptive variable names.
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##### 1. Download the dataset
Dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

##### 2. Create eight data frames
- features <- features.txt   
    Accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- activities <- activity_labels.txt   
    Activities performed
- subject_test <- test/subject_test.txt   
    Test data of volunteer test subjects
- x_test <- test/X_test.txt  
Recorded features test data
- y_test <- test/y_test.txt  
    Test data of activities
- subject_train <- test/subject_train.txt   
    Train data of volunteer subjects
- x_train <- test/X_train.txt   
    Recorded features train data
- y_train <- test/y_train.txt   
    Train data of activities

##### 3. Merge the training and the test sets to create one data set
- xmrg = rbind() merge of x_train and x_test  
- ymrg = rbind() merge of y_train and y_test
- smrg = rbind() merge of subject_train and subject_test
- sdata = cbind() merge smrg, xmrg, and ymrg

#### 4. Extracts only the measurements on the mean and standard deviation for each measurement
fdata = subset sdata of columns "subject", "id" and mean and standard deviation of each measurement.

#### 5. Uses descriptive activity names to name the activities in the data set
The id number was replaced by the following activities:
__id = Activity__
- 1 = "Walking"
- 2 = "Walking_upstairs"
- 3 = "Walking_downstairs"
- 4 = "Sitting"
- 5 = "Standing"
- 6 = "Laying"

#### 6. Appropriately labels the data set with descriptive variable names
The following names were replaced in the colum name:
- "id" = "Activity"
- "Acc" = "Accelerometer"
- "Gyro" = "Gyroscope"
- "Mag" = "Magnitude"
- "t" = "Time"
- "f" = "Frequency"
- "tBody" = "TimeBody"
- "freq" = "Frequency"
- "angle" = "Angle"
- "gravity" = "Gravity"


#### 7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
- new file TidyData2.txt created
