# unzip file
file_name="getdata_projectfiles_UCI HAR Dataset.zip"
unzip(file_name, list = TRUE)

#create variables
YTest <- read.table(unzip(file_name, "UCI HAR Dataset/test/y_test.txt"))
XTest <- read.table(unzip(file_name, "UCI HAR Dataset/test/X_test.txt"))
SubjectTest <- read.table(unzip(file_name, "UCI HAR Dataset/test/subject_test.txt"))
YTrain <- read.table(unzip(file_name, "UCI HAR Dataset/train/y_train.txt"))
XTrain <- read.table(unzip(file_name, "UCI HAR Dataset/train/X_train.txt"))
SubjectTrain <- read.table(unzip(file_name, "UCI HAR Dataset/train/subject_train.txt"))
Features <- read.table(unzip(file_name, "UCI HAR Dataset/features.txt"))

#import names
colnames(XTrain) <- t(Features[2])
colnames(XTest) <- t(Features[2])

#add activities and participants columns at the end
XTrain$activities <- YTrain[, 1]
XTrain$participants <- SubjectTrain[, 1]
XTest$activities <- YTest[, 1]
XTest$participants <- SubjectTest[, 1]

#AS1: Merges the training and the test sets to create one data set.
Merged_Data <- rbind(XTrain, XTest)

#AS2: Extracts only the measurements on the mean and standard deviation for each measurement.
Mean <- grep("mean()", names(Merged_Data), value = FALSE, fixed = TRUE)
Measurements_mean<- Merged_Data[Mean]
Stand_dev <- grep("std()", names(Merged_Data), value = FALSE)
Measurements_stand_dev<- Merged_Data[Stand_dev]

#AS3: Uses descriptive activity names to name the activities in the data set
Merged_Data$activities <- as.character(Merged_Data$activities)
Merged_Data$activities[Merged_Data$activities == 1] <- "WALKING"
Merged_Data$activities[Merged_Data$activities == 2] <- "WALKING_UPSTAIRS"
Merged_Data$activities[Merged_Data$activities == 3] <- "WALKING_DOWNSTAIRS"
Merged_Data$activities[Merged_Data$activities == 4] <- "SITTING"
Merged_Data$activities[Merged_Data$activities == 5] <- "STANDING"
Merged_Data$activities[Merged_Data$activities == 6] <- "LAYING"
Merged_Data$activities <- as.factor(Merged_Data$activities)

#AS4: Appropriately labels the data set with descriptive variable names.
names(Merged_Data) <- gsub("Acc", "Accelerator", names(Merged_Data))
names(Merged_Data) <- gsub("Mag", "Magnitude", names(Merged_Data))
names(Merged_Data) <- gsub("Gyro", "Gyroscope", names(Merged_Data))
names(Merged_Data) <- gsub("^t", "Time", names(Merged_Data))
names(Merged_Data) <- gsub("^f", "Frequency", names(Merged_Data))

Merged_Data$participants <- as.character(Merged_Data$participants)
Merged_Data$participants[Merged_Data$participants == 1] <- "Part1"
Merged_Data$participants[Merged_Data$participants == 2] <- "Part2"
Merged_Data$participants[Merged_Data$participants == 3] <- "Part3"
Merged_Data$participants[Merged_Data$participants == 4] <- "Part4"
Merged_Data$participants[Merged_Data$participants == 5] <- "Part5"
Merged_Data$participants[Merged_Data$participants == 6] <- "Part6"
Merged_Data$participants[Merged_Data$participants == 7] <- "Part7"
Merged_Data$participants[Merged_Data$participants == 8] <- "Part8"
Merged_Data$participants[Merged_Data$participants == 9] <- "Part9"
Merged_Data$participants[Merged_Data$participants == 10] <- "Part10"
Merged_Data$participants[Merged_Data$participants == 11] <- "Part11"
Merged_Data$participants[Merged_Data$participants == 12] <- "Part12"
Merged_Data$participants[Merged_Data$participants == 13] <- "Part13"
Merged_Data$participants[Merged_Data$participants == 14] <- "Part14"
Merged_Data$participants[Merged_Data$participants == 15] <- "Part15"
Merged_Data$participants[Merged_Data$participants == 16] <- "Part16"
Merged_Data$participants[Merged_Data$participants == 17] <- "Part17"
Merged_Data$participants[Merged_Data$participants == 18] <- "Part18"
Merged_Data$participants[Merged_Data$participants == 19] <- "Part19"
Merged_Data$participants[Merged_Data$participants == 20] <- "Part20"
Merged_Data$participants[Merged_Data$participants == 21] <- "Part21"
Merged_Data$participants[Merged_Data$participants == 22] <- "Part22"
Merged_Data$participants[Merged_Data$participants == 23] <- "Part23"
Merged_Data$participants[Merged_Data$participants == 24] <- "Part24"
Merged_Data$participants[Merged_Data$participants == 25] <- "Part25"
Merged_Data$participants[Merged_Data$participants == 26] <- "Part26"
Merged_Data$participants[Merged_Data$participants == 27] <- "Part27"
Merged_Data$participants[Merged_Data$participants == 28] <- "Part28"
Merged_Data$participants[Merged_Data$participants == 29] <- "Part29"
Merged_Data$participants[Merged_Data$participants == 30] <- "Part30"
Merged_Data$participants <- as.factor(Merged_Data$participants)

#AS5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidy_Dataset<-data.frame(Merged_Data, row.names = NULL, check.rows = FALSE,check.names = TRUE, fix.empty.names = TRUE,stringsAsFactors = default.stringsAsFactors())
Tidy_Dataset2<- aggregate(. ~ participants- activities, data = Tidy_Dataset, mean) 
Tidy_Dataset3<- Tidy_Dataset2[order(Tidy_Dataset2$participants,Tidy_Dataset2$activities),]
write.table(Tidy_Dataset3, file = "Tidy_Dataset.txt", row.names = FALSE)
