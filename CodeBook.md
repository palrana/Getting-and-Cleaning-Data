

   The attached R script (run_analysis.R) performs the following to clean up the data:

1. Merges the training and test sets to create one data set, namely
   train/X_train.txt with test/X_test.txt

2. Reads file features.txt and extracts only the measurements on the mean and standard deviation
   for each measurement.


3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

      walking

      walkingupstairs

      walkingdownstairs

      sitting

      standing

      laying

4. The script also appropriately labels the data set with descriptive names:
   all feature names (attributes) and activity names are converted to lower case,
   underscores and brackets () are removed.

      Then it merges the  data frame containing features with
      data frames containing activity labels and subject IDs.
      
      The result is saved as merged_clean_data.txt,
      such that the first column contains subject IDs,
      the second column activity names,
      and the last 66 columns are measurements.
      Subject IDs are integers between 1 and 30 inclusive.
      Names of the attributes are similar to the following:
      
      tbodyacc-mean-x 
      
      tbodyacc-mean-y 
      
      tbodyacc-mean-z 
      
      tbodyacc-std-x 
      
      tbodyacc-std-y 
      
      tbodyacc-std-z 
      
      tgravityacc-mean-x 
      
      tgravityacc-mean-y

5. Finally, the script creates a 2nd, independent tidy data set with the average
   of each measurement for each activity and each subject.

      The result is saved as data_set_with_averages.txt,
      the first column contains subject IDs, the second column contains activity names (see below),
      and then the averages for each of the 66 attributes are in columns 3...68.
      There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.

