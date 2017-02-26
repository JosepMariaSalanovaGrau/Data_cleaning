Codebook

This Codebook describes the data source, the variables and the transformations.

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone and can be download in 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description about the data can be found in  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following files are contained in the dataset:

    'README.txt'
    'features_info.txt': Information about the variables.
    'features.txt': List of features.
    'activity_labels.txt': Relation of class labels and activity names.
    'train/X_train.txt': Training set.
    'train/y_train.txt': Training labels.
    'test/X_test.txt': Test set.
    'test/y_test.txt': Test labels.

Transformation details
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

