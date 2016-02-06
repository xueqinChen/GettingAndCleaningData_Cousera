## Getting and Cleaning Data

This is repository for Getting and Cleaning Data Coursera Project, for more details, please visit https://www.coursera.org/learn/data-cleaning/.

## Script

### The following shows how to run run_analysis.R

* First, Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local files, rename it "data".

* Second, call "source("run_analysis.R")" in RStudio Command

* Third, there will produces two output files,
    1. combine_data.txt: which is a data frame combine all data sets
    2. mean_data.txt: which is a data frame with tidy data.
    

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
 
     1. use aggregate to caculate average of each variable for each activity and each subject.
     The last we get 180x68 tidy data frame.


