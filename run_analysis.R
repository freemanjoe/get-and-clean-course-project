require(plyr)
raw_x_train <- read.table(file.choose(), sep = '') # read X_train.txt
raw_x_test <- read.table(file.choose(), sep = '') # read X_test.txt
raw_x_data <- rbind(raw_x_train, raw_x_test) # merge the training and testing x data sets
raw_y_train <- read.table(file.choose(), sep = '') # read Y_train.txt
raw_y_test <- read.table(file.choose(), sep = '') # read Y_test.txt
raw_y_data <- rbind(raw_y_train, raw_y_test) # merge the training and testing y data sets
raw_sub_train <- read.table(file.choose(), sep = '') # read subject_train.txt
raw_sub_test <- read.table(file.choose(), sep = '') # read subject_test.txt
raw_sub_data <- rbind(raw_sub_train, raw_sub_test) # merge the training and testing subject data sets
labels <- read.table(file.choose(), sep = '') # read activity_labels.txt for labels
#labels <- as.vector(labels$V2)
features <- read.table(file.choose(), sep = '') # read features.txt for features
#features <- as.vector(features$V2)
feat_mean_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) # only need mean and standard deviation for each subject
processed_x_data <- raw_x_data[, feat_mean_sd]
names(processed_x_data) <- features[feat_mean_sd, 2]
processed_y_data <- raw_y_data
processed_y_data[, 1] <- labels[processed_y_data[, 1], 2] # assign a descriptive column according to activity_labels.txt
names(processed_y_data) <- 'activity_type' # name the descriptive column
processed_sub_data <- raw_sub_data
names(processed_sub_data) <- 'subject_number' # name the subject data
cleaned_dataset <- cbind(processed_sub_data, processed_y_data, processed_x_data) # merge processed datasets to new one
cleaned_dataset$activity_type <- as.factor(cleaned_dataset$activity_type)
cleaned_dataset$subject_number <- as.factor(cleaned_dataset$subject_number)
average_cleaned <- aggregate(cleaned_dataset, by = list(activity = cleaned_dataset$activity_type, subject = cleaned_dataset$activity_type$subject_number), mean) # generate the averaged tidy dataset
write.table(average_cleaned, row.name = FALSE, file = file.choose(new = TRUE)) # write tidy_data.txt