


getdata<- function(dir, datatype){
  trainfile <-  paste(dir,"/train/", datatype, "_train.txt", sep = "")
  testfile <-   paste(dir,"/test/", datatype, "_test.txt", sep = "")
  traindata <- read.table(trainfile)
  testdata <- read.table(testfile)
  mergedfile <- rbind(traindata,testdata)
}




run.analysis <- function(dir){
  
  # get data for each descriptive activity
  X <- getdata(dir,"X")
  Y <- getdata(dir,"y")
  S <- getdata(dir,"subject")
  
  # extract the features that need to be worked on.
  # Extracts only the measurements on the mean and standard deviation for each measurement
  features <- read.table("features.txt")
  features_index <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
  X <- X[, features_index]
  names(X) <- features[features_index, 2]
  names(X) <- gsub("\\(|\\)", "", names(X))
  names(X) <- tolower(names(X)) 
  names(X)
  
  # 3. Uses descriptive activity names to name the activities in the data set
  
  activities <- read.table("activity_labels.txt")
  activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
  Y[,1] = activities[Y[,1], 2]
  names(Y) <- "activity"
  
  # 4. Appropriately labels the data set with descriptive activity names.
  
  names(S) <- "subject"
  # Merge the training and the test sets to create one data set.
  cleaned <- cbind(S, Y, X)
  write.table(cleaned, "merged_clean_data.txt")
  
  # 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
  
       uniqueSubjects = unique(S)[,1]
       numSubjects = length(unique(S)[,1])
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
      write.table(result, "data_set_with_averages.txt")
  
}