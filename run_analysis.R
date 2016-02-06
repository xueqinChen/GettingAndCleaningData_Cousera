# Step1. Merges the training and the test sets to create one data set.
# Read train data sets
xTrainSet <- read.table("./data/train/X_train.txt")
yTrainLable <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")

# Read test data sets
xTestSet <- read.table("./data/test/X_test.txt")
yTestLable <- read.table("./data/test/y_test.txt") 
testSubject <- read.table("./data/test/subject_test.txt")

# Combine data sets
setData <- rbind(xTrainSet, xTestSet)
lableData <- rbind(yTrainLable, yTestLable)
subjectData <- rbind(trainSubject, testSubject)
# [10299  561]
print(dim(setData))
# [10299  1]
print(dim(lableData))
# [10299  1]
print(dim(subjectData))

# Step2. Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
features <- read.table("./data/features.txt")
# Grep mean() or std() rows
meanStdIndex <- grep("mean\\(\\)|std\\(\\)", features[, 2])
setData <- setData[, meanStdIndex]
print(dim(setData) )# [10299 66]
# Tidy data, remove "()" , "-", and make names descriptive
names(setData) <- gsub("-", "", features[meanStdIndex, 2])
names(setData) <- gsub("mean\\(\\)", "Mean", names(setData))
names(setData) <- gsub("std\\(\\)", "Std", names(setData))
names(setData) <- gsub("BodyBody", "Body", names(setData))

# Step3. Uses descriptive activity names to name the activities in 
# the data set
activityLables <- read.table("./data/activity_labels.txt")
# Remove "-", it not descriptive
activityLables[, 2] <- tolower(gsub("_", "", activityLables[, 2]))
# Capitalize the first letter for each word
activityLables[, 2] <- gsub("upstairs", "Upstairs", activityLables[, 2])
activityLables[, 2] <- gsub("downstairs", "Downstairs", activityLables[, 2])
# Class lable replace with activity lable
activity <- activityLables[lableData[, 1], 2]
lableData[, 1] <- activity
names(lableData) <- "activity"

# Step4. Appropriately labels the data set with descriptive activity 
# names. 
names(subjectData) <- "subject"
combineData <- cbind(subjectData, lableData, setData)
write.table(combineData, "combine_data.txt")
# 10299 x 68
print(dim(combineData))

# Step5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
meandata<-aggregate(combineData[, 3:columnLen], list(combineData$subject,combineData$activity), mean)
# Rename Group.1 to subject
names(meandata)[1] = "subject"
# Rename Group.2 to activity
names(meandata)[2] = "activity" 
head(meandata)
# 180 x 68
print(dim(meandata))
write.table(meandata, "mean_data.txt")