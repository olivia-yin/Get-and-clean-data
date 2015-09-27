Introduction
The script run_analysis.R performs the 5 steps described in the course project's definition.
•	First, merged train and test datasets using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
•	Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
•	As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
•	On the whole dataset, those columns with vague column names are corrected.
•	Finally, generate a new dataset with all the average measures for each subject and activity. The output file is called averages_data.txt, and uploaded to this repository.
Variables
•	Xtrain, Ytrain, Xtest, Ytest, Strain and Stest contain the data from the downloaded files.
•	X, Y and subject merge the previous datasets to further analysis.
•	features contains the correct names for the X dataset, which are applied to the column names stored in features, a numeric vector used to extract the desired data.
•	XY merges x_data, y_data and then merges subject_data in a big dataset named AllData.
•	A similar approach of features is taken with activity names through the activities variable.
•	Use cbind() to merge X and Activities datasets in X_activities, then  merge subject with it into update_All .
•	Finally, averages_data contains  the average of each variable for each activity and each subject.

