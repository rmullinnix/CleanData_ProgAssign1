## Getting and Cleaning Data - Course Project

## Code Book

### Project Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Script - run_analysis.R

*  Description:  Creates a tidy data frame of the data collected from
*    the accelerometers from the Samsung Galaxy S smartphone.
*  Input:  Data is in a series of files representing the activities, subjects, and data points collected from the smartphone
*     - features.txt - list of columns in the data file with the collected data points
*     - activity_lables.txt - description of the activities subjects were involved in
*     - subject_test.txt / subject_train.txt - list of subjects for the data point rows
*     - Y_test.txt / Y_train.txt - list of activities for the data point rows
*     - X_test.txt / X_train.txt - collected data points for subjects and activities
*  Output:  Data set of the mean of the collected data points grouped by subject and activity
    
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
```
UCI HAR Dataset/
  /test
    subject_test.txt    (subject ids for the corresponding rows in the X_test file)
    X_test.txt          (observations for subjects and activities across data items in features.txt)
    Y_text.txt          (activity ids for the corresponding rows in the X_test file)
  /train
    subject_train.txt   (subject ids for the corresponding rows in the X_train file)
    X_train.txt         (observations for subjects and activities across data items in features.txt)
    Y_train.txt         (activity ids for the corresponding rows in the X_train file)
  activity_labels.txt   (descriptive labels for the activities)
  features.txt          (list of the columns for the X_test.txt and Y_text.txt files)
  features_info.txt     (not used)
``` 
### Resultant Set
```
Grouped By:  Subject ID, Activity Label

 Subject                             : int
 Activity                            : factor   [ LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS ]
 tBodyAcc-mean()-X                   : numeric
 tBodyAcc-mean()-Y                   : numeric
 tBodyAcc-mean()-Z                   : numeric
 tBodyAcc-std()-X                    : numeric
 tBodyAcc-std()-Y                    : numeric
 tBodyAcc-std()-Z                    : numeric
 tGravityAcc-mean()-X                : numeric
 tGravityAcc-mean()-Y                : numeric
 tGravityAcc-mean()-Z                : numeric
 tGravityAcc-std()-X                 : numeric
 tGravityAcc-std()-Y                 : numeric
 tGravityAcc-std()-Z                 : numeric
 tBodyAccJerk-mean()-X               : numeric
 tBodyAccJerk-mean()-Y               : numeric
 tBodyAccJerk-mean()-Z               : numeric
 tBodyAccJerk-std()-X                : numeric
 tBodyAccJerk-std()-Y                : numeric
 tBodyAccJerk-std()-Z                : numeric
 tBodyGyro-mean()-X                  : numeric
 tBodyGyro-mean()-Y                  : numeric
 tBodyGyro-mean()-Z                  : numeric
 tBodyGyro-std()-X                   : numeric
 tBodyGyro-std()-Y                   : numeric
 tBodyGyro-std()-Z                   : numeric
 tBodyGyroJerk-mean()-X              : numeric
 tBodyGyroJerk-mean()-Y              : numeric
 tBodyGyroJerk-mean()-Z              : numeric
 tBodyGyroJerk-std()-X               : numeric
 tBodyGyroJerk-std()-Y               : numeric
 tBodyGyroJerk-std()-Z               : numeric
 tBodyAccMag-mean()                  : numeric
 tBodyAccMag-std()                   : numeric
 tGravityAccMag-mean()               : numeric
 tGravityAccMag-std()                : numeric
 tBodyAccJerkMag-mean()              : numeric
 tBodyAccJerkMag-std()               : numeric
 tBodyGyroMag-mean()                 : numeric
 tBodyGyroMag-std()                  : numeric
 tBodyGyroJerkMag-mean()             : numeric
 tBodyGyroJerkMag-std()              : numeric
 fBodyAcc-mean()-X                   : numeric
 fBodyAcc-mean()-Y                   : numeric
 fBodyAcc-mean()-Z                   : numeric
 fBodyAcc-std()-X                    : numeric
 fBodyAcc-std()-Y                    : numeric
 fBodyAcc-std()-Z                    : numeric
 fBodyAcc-meanFreq()-X               : numeric
 fBodyAcc-meanFreq()-Y               : numeric
 fBodyAcc-meanFreq()-Z               : numeric
 fBodyAccJerk-mean()-X               : numeric
 fBodyAccJerk-mean()-Y               : numeric
 fBodyAccJerk-mean()-Z               : numeric
 fBodyAccJerk-std()-X                : numeric
 fBodyAccJerk-std()-Y                : numeric
 fBodyAccJerk-std()-Z                : numeric
 fBodyAccJerk-meanFreq()-X           : numeric
 fBodyAccJerk-meanFreq()-Y           : numeric
 fBodyAccJerk-meanFreq()-Z           : numeric
 fBodyGyro-mean()-X                  : numeric
 fBodyGyro-mean()-Y                  : numeric
 fBodyGyro-mean()-Z                  : numeric
 fBodyGyro-std()-X                   : numeric
 fBodyGyro-std()-Y                   : numeric
 fBodyGyro-std()-Z                   : numeric
 fBodyGyro-meanFreq()-X              : numeric
 fBodyGyro-meanFreq()-Y              : numeric
 fBodyGyro-meanFreq()-Z              : numeric
 fBodyAccMag-mean()                  : numeric
 fBodyAccMag-std()                   : numeric
 fBodyAccMag-meanFreq()              : numeric
 fBodyBodyAccJerkMag-mean()          : numeric
 fBodyBodyAccJerkMag-std()           : numeric
 fBodyBodyAccJerkMag-meanFreq()      : numeric
 fBodyBodyGyroMag-mean()             : numeric
 fBodyBodyGyroMag-std()              : numeric
 fBodyBodyGyroMag-meanFreq()         : numeric
 fBodyBodyGyroJerkMag-mean()         : numeric
 fBodyBodyGyroJerkMag-std()          : numeric
 fBodyBodyGyroJerkMag-meanFreq()     : numeric
 angle(tBodyAccMean,gravity)         : numeric
 angle(tBodyAccJerkMean),gravityMean): numeric
 angle(tBodyGyroMean,gravityMean)    : numeric
 angle(tBodyGyroJerkMean,gravityMean): numeric
 angle(X,gravityMean)                : numeric
 angle(Y,gravityMean)                : numeric
 angle(Z,gravityMean)                : nueric
 ```
