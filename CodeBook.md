Variables:

  Subjects - An integer value from 1 to 30 qualifying the volunteer on which the measurement is taking place.
  
  Activity - A character value "Walking","Walking Upstairs","Walking Downstairs","Sitting", "Standing", "Laying", describing the activity taking place in the measurement.
  
  Features - All the other variables are features from the "features.txt" file that contain the word "mean" or "std". They give the mean for a certain subject and activity performed of a feature being measured on the mean or standard deviation. A more in depth description of each feature and what they mean can be found in the "feature_info.txt" file. 
  
Data:
  This data set is a tidy wide data set which gives the average of each feature for each activity and each subject that was experimented. 
  A more in depth explanation of the experiment taking place can be found in the "README.txt" file.
  
Cleaning up the data:
- The testing and training sets were merged for all the features.
- The column names were changed to describe the features measured.
- The merged data set was subsetted to only keep the features on the mean or standard deviation.
- The testing and training sets for the activities and subjects were merged.
- The numbers in the activities column were changed to character names which describe the activity taking place.
- The column names were changed for the activities and subjects to describe the variables more acurately.
- The activity, subject and features columns were brought together to create the cleaned data set.
- The data set was tidied in a narrow shape with the function melt() to give a column describing the feature and another giving the value measured for that feature. This ensured that the one variable per column rule was followed.
- The column name for the new column "variable"" was changed to "Feature"" to better describe the variable.
- A new data set was created calculating the mean value for each subject and each activity and each feature using the dcast() function.
