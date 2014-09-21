# 1. Merges the training and the test sets to create one data set.

xTrain <- read.table("train/X_train.txt")
xTest <- read.table("test/X_test.txt")
xTotal <- rbind(xTrain, xTest)

sTrain <- read.table("train/subject_train.txt")
sTest <- read.table("test/subject_test.txt")
sTotal <- rbind(sTrain, sTest)

yTrain <- read.table("train/y_train.txt")
yTest <- read.table("test/y_test.txt")
yTotal <- rbind(yTrain, yTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
xTotal <- xTotal[, indices_of_good_features]
names(xTotal) <- features[indices_of_good_features, 2]
names(xTotal) <- gsub("\\(|\\)", "", names(xTotal))
names(xTotal) <- tolower(names(xTotal))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
yTotal[,1] = activities[yTotal[,1], 2]
names(yTotal) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(sTotal) <- "subject"
cleaned <- cbind(sTotal, yTotal, xTotal)
write.table(cleaned, "FinalData.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(sTotal)[,1]
numSubjects = length(unique(sTotal)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "DataWithAverages.txt")