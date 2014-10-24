library(dplyr)

columns <- read.table("UCI HAR Dataset/features.txt")
act_nms <- read.table("UCI HAR Dataset/activity_labels.txt")

test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_act <- read.table("UCI HAR Dataset/test/Y_test.txt")

colnames(test) <- columns$V2

test$Subject <- test_subj$V1
test$Activity <- act_nms[test_act$V1, "V2"]
rownames(test) <- paste("test", seq(1:nrow(test)), sep="")
    
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_act <- read.table("UCI HAR Dataset/train/Y_train.txt")

colnames(train) <- columns$V2

train$Subject <- train_subj$V1
train$Activity <- act_nms[train_act$V1, "V2"]
rownames(train) <- paste("train", seq(1:nrow(train)), sep="")

combined <- rbind(test, train)

filt_cols <- grep("std|mean|activity|subject", colnames(combined), ignore.case=TRUE)
filt_data <- combined[, filt_cols]

sum_dat <- tbl_df(filt_data)
sum_dat <- group_by(sum_dat, Subject, Activity)

tidy_dat <- sum_dat %>% summarise_each(funs(mean))

write.table(tidy_dat, "tidy_data.txt", row.name=FALSE)
