## run_analysis.R
#
#  Description:  Creates a tidy data frame of the data collected from
#    the accelerometers from the Samsung Galaxy S smartphone.
#  Input:  Data is in a series of files representing the activities, subjects, and
#    data points collected from the smartphone
#     - features.txt - list of columns in the data file with the collected data points
#     - activity_lables.txt - description of the activities subjects were involved in
#     - subject_test.txt / subject_train.txt - list of subjects for the data point rows
#     - Y_test.txt / Y_train.txt - list of activities for the data point rows
#     - X_test.txt / X_train.txt - collected data points for subjects and activities
#  Output:  Data set of the mean of the collected data points grouped by subject and
#    activity

library(dplyr)

# check to make sure data directory is in the working directory
if (length(dir("UCI HAR Dataset")) == 0)
    stop("<UCI HAR Dataset> not present in working directory")

# read the column and activity descriptions
columns <- read.table("UCI HAR Dataset/features.txt")
act_nms <- read.table("UCI HAR Dataset/activity_labels.txt")

# read the test data files - data points for subjects and activities
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_act <- read.table("UCI HAR Dataset/test/Y_test.txt")

# set the column names from the features.txt file
colnames(test) <- columns$V2

# assign the subject id and activity name to correct row
test$Subject <- test_subj$V1
test$Activity <- act_nms[test_act$V1, "V2"]
rownames(test) <- paste("test", seq(1:nrow(test)), sep="")

# read the train data files - data points for subjects and activities
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_act <- read.table("UCI HAR Dataset/train/Y_train.txt")

# set the column names from the features.txt file
colnames(train) <- columns$V2

# assign the subject id and activity name to correct row
train$Subject <- train_subj$V1
train$Activity <- act_nms[train_act$V1, "V2"]
rownames(train) <- paste("train", seq(1:nrow(train)), sep="")

# combine the test and train data sets
combined <- rbind(test, train)

# extract only columns representing std deviation and mean
filt_cols <- grep("std|mean|activity|subject", colnames(combined), ignore.case=TRUE)
filt_data <- combined[, filt_cols]

# group data by subject and activity
sum_dat <- tbl_df(filt_data)
sum_dat <- group_by(sum_dat, Subject, Activity)

# compute mean for all data points by subject and activity
tidy_dat <- sum_dat %>% summarise_each(funs(mean))

# write the summarized data to a file
write.table(tidy_dat, "tidy_data.txt", row.name=FALSE)
