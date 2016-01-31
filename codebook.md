### The Data
* The original data: https:
//d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Original description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### The variables

* The suject column is from subject_[test|train].txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* the activity colum is from activity_lables.txt and Y_test.txt and Y_train.txt. It describe human activities.

### The steps of run_analysis.R
* Step1. Merges the training and the test sets to create one data set.
 Read train data sets
 
     1. read data sets in ./data/train, stores them in xTrainSet, yTrainLable, trainSubject.
     
     2. read data sets in ./data/test, stores them in xTestSet, yTestLable,testSubject.
     
     3. combine xTrainSet and xTestSet to setData, produces a 10299x561 data frame; combine yTrainLable and yTestLable to lableData generates a 10299 x1 data frame; combine yTrainLable and  yTestLable to subjectData generates a 10299 x 1 data frame.


* Step2. Extracts only the measurements on the mean and standard 
 deviation for each measurement. 
 
     1. read features.txt in features data frame.
     
     2. extract the measurements on the  "mean" or "std", produces 10299x66 setData
     
     3. Tidy data, remove "()" , "-", and make names descriptive
 

* Step3. Uses descriptive activity names to name the activities in 
the data set
 
     1. read activity_labels.txt file from ./data, data stores in activityLables.
     
     2. make names lower case, then make the second world first letters upper case to   make world easy read.
     
     3. rransform the values of lableData according to the activityLables data frame.   there is a correspondence reletionship.


* Step4. Appropriately labels the data set with descriptive activity  names

     1. names the subjectData, and combine subjectData lableData setData to combineData, and write it to combine_data.txt
 
* Step5. From the data set in step 4, creates a second, independent tidy data set 
 with the average of each variable for each activity and each subject.
 
     1. there are 30 subject and 6 activity, get 180 rows, the same column of combineData. for each combination, we calculate the mean of each column one by one.
     The last we get 180x68 tidy data frame.
