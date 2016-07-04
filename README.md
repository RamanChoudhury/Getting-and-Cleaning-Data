# Getting-and-Cleaning-Data
This is the folder containing the script for run_analysis for the assignment
##1.	The first step is to merge the files within the data sets of “train” and “test”
##2.	The subject_test and subject_train files hold the data that correspond to the respective subject numbers and they are given primary keys to ensure that these can be mapped to the final data set
##3.	The y_test and y_train files have the data corresponding to the activity category. A primary key is added based on the integer sequencing
##4.	The X_test and X_train files have the data corresponding to the entire observational data set. A primary key is added based on the integer sequencing
##5.	These 3 files are then merged using the primary  key.
##6.	The 9 files in each of the train and test data sets are then explored to allow the respective mean and standard deviation values to be added to each set of 128 observations. The assumption is that we will use the mean and standard deviation of each frame of 128 values.
##7.	The final file from the 9 merged files of Inertial Signals folder is then merged with the earlier merged file of subject, activity and total observations
##8.	The final file is generated from the merging within the train and test data sets
##9.	There is a slight modification done to the primary key by adding the subject category (test or train) by concatenating the existing primary key with the required subject category type
##10.	The final set is then derived by merging these sets from train and test
##11.	As the final data set has to be tidy and average values found for each activity and category, the subject category and activity labels are concatenated
##12.	Then the dplyr package is used to find the summarize_each for each unique subject activity pair – it is important to note that only 40 such pairs are generated from a possible set of 180 sets.

