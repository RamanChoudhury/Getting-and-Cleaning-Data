#Run_analysis.R Codebook

##1.	primaryID
###a.	This is introduced in every data frame created from both the “test” and the “train” dataset – 
####i.	uses the serial number to introduce a primary key into the initial data set in 
####1.	subject_test.txt/subject_train.txt 
####2.	y_test.txt/y_train.txt
####3.	all Inertial Signals folder files – both train and test data sets
#2.	subject_test / subject_train
##a.	Data frame holding the data for the subject numbers (9 subjects for test and 21 subjects for train) against every observation
#3.	variables_561_list
##a.	Holds the initial list of all the 561 variables for the readings in the main observations file (X_test.txt/X_train.txt)
#4.	variables_561_vector
##a.	Vector conversion of the variables_561_list
#5.	activity_train / activity_test
##a.	holds the merged data frame with the primaryID and the respective activity label
#6.	total_observations_train/total_observations_test
##a.	Data Frame that holds the entire data set of “X_train.txt” / “X_test.txt respectively mapped with the primaryID and the 561 variables list from variables_561_vector
##b.	At the end of the train & test data set operations, the data set primaryID is changed to include the category type (‘test’ & ‘train’) so that the test and train data sets have different
##c.	At the last step, the data set is merged with the mean values and the SD values from 
#7.	activity_subject_train / activity_subject_test
##a.	merged data set with activity and subject data
##b.	This is subsequently merged with the total_observations_train / total_observations_test set to get a complete data set with the 561 variables, subject_no, and activity_label mapped
##c.	This is the interim data set that will be merged between the train and test data sets to get the final data set
#8.	keep_list
##a.	repeated for the 9 files housed within the Inertial Signals folder of both train and test data sets – holds the 3 important variables that need to be stored
###i.	primaryID – the primary key that would link up with the other files
###ii.	<body_acc_x>_meanvalue – the bracketed portion would change according to the file that is being read in the relevant code portion – holds the mean of the 128 values in the window that was stored
###iii.	<body_acc_x>_sdvalue - the bracketed portion would change according to the file that is being read in the relevant code portion – holds the standard deviation of the 128 values in the window that was stored
#9.	<body_acc_>xy_train – replacing the bracketed portion with the other key files in the Inertial Signals folder (includes body_gyro and total_acc)
##a.	Holds the interim data frame with the x & y components in the respective file types
#10.	<body_acc_>xyz_train – replacing the bracketed portion with the other key files in the Inertial Signals folder (includes body_gyro and total_acc)
##a.	Holds the interim data frame with the x, y and z components in the respective file types
#11.	final_merged_set
##a.	final data frame holding the ‘test’ and ‘train’ data sets
##b.	an added variable – subject_activity_category is added to bring about a grouping variable before the final tidying of the data set. This concatenates the subject no and the activity grouping
#12.	final_merged_set_DT
##a.	Data Table version of the data frame final_merged_set
#13.	tidy_set_group
##a.	Grouped version of the final_merged_set on the subject_activity_category 
#14.	tidy_set
##a.	final tidy data set of the unique subject no and activity combinations
#15.	final_tidy_set.txt 
##a.	final output data file




