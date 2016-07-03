#It is assumed here that the data set is stored in the default working directory
#The data referred to here are within the data folder "UCI HAR Dataset" after being unzipped




###final output from the train folder will have the following structure

  #<primary key>+<Activity Code>+<Subject ID>+<561 variables in X_test>+<Inertial Signals-9 variables>

  #store variables in a data frame - will have to be added later to the interim and final data sets 

variables_561_list<-read.table("./features.txt",col.names=c("variable_no","variable_name"))
variables_561_vector<-as.character(variables_561_list$variable_name)

activity_list<-read.table("./activity_labels.txt",col.names=c("activity_no","activity_label"))


#working on train data set "train"

#subject-train file
subject_train<-read.table("./train/subject_train.txt",col.names = "subject_no")
subject_train$primaryID<-seq.int(nrow(subject_train))

#y_train file
activity_train_interim<-read.table("./train/y_train.txt",col.names = "activity_no")
activity_train<-merge(activity_train_interim,activity_list,by.x="activity_no",by.y="activity_no")
activity_train$primaryID<-seq.int(nrow(activity_train))
activity_train$activity_no<-NULL

#X_train file

total_observations_train<-read.table("./train/X_train.txt",col.names=variables_561_vector)
total_observations_train$primaryID<-seq.int(nrow(total_observations_train))

#merging activity, subject and total observations datasets
activity_subject_train<-merge(activity_train,subject_train,by.x="primaryID",by.y="primaryID")
total_observations_train<-merge(activity_subject_train,total_observations_train,by.x="primaryID",by.y="primaryID")


    ###########Inertial Signals - body_acc_x_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_acc_x_meanvalue","body_acc_x_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
    name_list1[i]<-paste("body_acc_x_train",i,sep="")
    }
    
    body_acc_x_train<-read.table("./train/Inertial Signals/body_acc_x_train.txt",col.names=name_list1)
    body_acc_x_train$body_acc_x_meanvalue<-rowMeans(body_acc_x_train[,1:128])
    for(j in 1:128)
    
    {
    body_acc_x_train$body_acc_x_sdvalue[j]<-sd(as.numeric(body_acc_x_train[j,1:128]))
    }
    
    body_acc_x_train$primaryID<-seq.int(nrow(body_acc_x_train))
    body_acc_x_train<-body_acc_x_train[keep_list]

    
    ###########Inertial Signals - body_acc_y_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_acc_y_meanvalue","body_acc_y_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_acc_y_train",i,sep="")
    }
    
    body_acc_y_train<-read.table("./train/Inertial Signals/body_acc_y_train.txt",col.names=name_list1)
    body_acc_y_train$body_acc_y_meanvalue<-rowMeans(body_acc_y_train[,1:128])
    for(j in 1:128)
      
    {
      body_acc_y_train$body_acc_y_sdvalue[j]<-sd(as.numeric(body_acc_y_train[j,1:128]))
    }
    
    body_acc_y_train$primaryID<-seq.int(nrow(body_acc_y_train))
    body_acc_y_train<-body_acc_y_train[keep_list]
    
    ###########Inertial Signals - body_acc_z_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_acc_z_meanvalue","body_acc_z_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_acc_z_train",i,sep="")
    }
    
    body_acc_z_train<-read.table("./train/Inertial Signals/body_acc_z_train.txt",col.names=name_list1)
    body_acc_z_train$body_acc_z_meanvalue<-rowMeans(body_acc_z_train[,1:128])
    for(j in 1:128)
      
    {
      body_acc_z_train$body_acc_z_sdvalue[j]<-sd(as.numeric(body_acc_z_train[j,1:128]))
    }
    
    body_acc_z_train$primaryID<-seq.int(nrow(body_acc_z_train))
    body_acc_z_train<-body_acc_z_train[keep_list]
    
    ###########Inertial Signals - body_gyro_x_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_gyro_x_meanvalue","body_gyro_x_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_gyro_x_train",i,sep="")
    }
    
    body_gyro_x_train<-read.table("./train/Inertial Signals/body_gyro_x_train.txt",col.names=name_list1)
    body_gyro_x_train$body_gyro_x_meanvalue<-rowMeans(body_gyro_x_train[,1:128])
    for(j in 1:128)
      
    {
      body_gyro_x_train$body_gyro_x_sdvalue[j]<-sd(as.numeric(body_gyro_x_train[j,1:128]))
    }
    
    body_gyro_x_train$primaryID<-seq.int(nrow(body_gyro_x_train))
    body_gyro_x_train<-body_gyro_x_train[keep_list]
    
    ###########Inertial Signals - body_gyro_y_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_gyro_y_meanvalue","body_gyro_y_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_gyro_y_train",i,sep="")
    }
    
    body_gyro_y_train<-read.table("./train/Inertial Signals/body_gyro_y_train.txt",col.names=name_list1)
    body_gyro_y_train$body_gyro_y_meanvalue<-rowMeans(body_gyro_y_train[,1:128])
    for(j in 1:128)
      
    {
      body_gyro_y_train$body_gyro_y_sdvalue[j]<-sd(as.numeric(body_gyro_y_train[j,1:128]))
    }
    
    body_gyro_y_train$primaryID<-seq.int(nrow(body_gyro_y_train))
    body_gyro_y_train<-body_gyro_y_train[keep_list]
    
    ###########Inertial Signals - body_gyro_z_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_gyro_z_meanvalue","body_gyro_z_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_gyro_z_train",i,sep="")
    }
    
    body_gyro_z_train<-read.table("./train/Inertial Signals/body_gyro_z_train.txt",col.names=name_list1)
    body_gyro_z_train$body_gyro_z_meanvalue<-rowMeans(body_gyro_z_train[,1:128])
    for(j in 1:128)
      
    {
      body_gyro_z_train$body_gyro_z_sdvalue[j]<-sd(as.numeric(body_gyro_z_train[j,1:128]))
    }
    
    body_gyro_z_train$primaryID<-seq.int(nrow(body_gyro_z_train))
    body_gyro_z_train<-body_gyro_z_train[keep_list]
    
    ###########Inertial Signals - total_acc_x_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","total_acc_x_meanvalue","total_acc_x_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("total_acc_x_train",i,sep="")
    }
    
    total_acc_x_train<-read.table("./train/Inertial Signals/total_acc_x_train.txt",col.names=name_list1)
    total_acc_x_train$total_acc_x_meanvalue<-rowMeans(total_acc_x_train[,1:128])
    for(j in 1:128)
      
    {
      total_acc_x_train$total_acc_x_sdvalue[j]<-sd(as.numeric(total_acc_x_train[j,1:128]))
    }
    
    total_acc_x_train$primaryID<-seq.int(nrow(total_acc_x_train))
    total_acc_x_train<-total_acc_x_train[keep_list]
    
    ###########Inertial Signals - total_acc_y_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","total_acc_y_meanvalue","total_acc_y_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("total_acc_y_train",i,sep="")
    }
    
    total_acc_y_train<-read.table("./train/Inertial Signals/total_acc_y_train.txt",col.names=name_list1)
    total_acc_y_train$total_acc_y_meanvalue<-rowMeans(total_acc_y_train[,1:128])
    for(j in 1:128)
      
    {
      total_acc_y_train$total_acc_y_sdvalue[j]<-sd(as.numeric(total_acc_y_train[j,1:128]))
    }
    
    total_acc_y_train$primaryID<-seq.int(nrow(total_acc_y_train))
    total_acc_y_train<-total_acc_y_train[keep_list]
    
    ###########Inertial Signals - total_acc_z_train
    
    ##file_list<-list.files("./train/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","total_acc_z_meanvalue","total_acc_z_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("total_acc_z_train",i,sep="")
    }
    
    total_acc_z_train<-read.table("./train/Inertial Signals/total_acc_z_train.txt",col.names=name_list1)
    total_acc_z_train$total_acc_z_meanvalue<-rowMeans(total_acc_z_train[,1:128])
    for(j in 1:128)
      
    {
      total_acc_z_train$total_acc_z_sdvalue[j]<-sd(as.numeric(total_acc_z_train[j,1:128]))
    }
    
    total_acc_z_train$primaryID<-seq.int(nrow(total_acc_z_train))
    total_acc_z_train<-total_acc_z_train[keep_list]
    
    #merging starts within the inertial signals files
    body_acc_xy_train<-merge(body_acc_x_train,body_acc_y_train,by.x="primaryID",by.y="primaryID")
    body_acc_xyz_train<-merge(body_acc_xy_train,body_acc_z_train,by.x="primaryID",by.y="primaryID")
    
    body_gyro_xy_train<-merge(body_gyro_x_train,body_gyro_y_train,by.x="primaryID",by.y="primaryID")
    body_gyro_xyz_train<-merge(body_gyro_xy_train,body_gyro_z_train,by.x="primaryID",by.y="primaryID")
    
    total_acc_xy_train<-merge(total_acc_x_train,total_acc_y_train,by.x="primaryID",by.y="primaryID")
    total_acc_xyz_train<-merge(total_acc_xy_train,total_acc_z_train,by.x="primaryID",by.y="primaryID")
    
    body_acc_gyro_xyz_train<-merge(body_acc_xyz_train,body_gyro_xyz_train,by.x="primaryID",by.y="primaryID")
    body_acc_gyro_total_xyz_train<-merge(body_acc_gyro_xyz_train,total_acc_xyz_train,by.x="primaryID",by.y="primaryID")
    
    #merging final inertial signals and total observations merged files
    total_observations_train<-merge(total_observations_train,body_acc_gyro_total_xyz_train,by.x="primaryID",by.y="primaryID")
    for(i in 1:nrow(total_observations_train))
      {
        total_observations_train$subject_category="train"
        total_observations_train$primaryID[i]=paste(total_observations_train$primaryID[i],"train",sep="_")
      }
      
    
    
    #working on test data set "test"
    
    #subject-test file
    subject_test<-read.table("./test/subject_test.txt",col.names = "subject_no")
    subject_test$primaryID<-seq.int(nrow(subject_test))
    
    #y_test file
    activity_test_interim<-read.table("./test/y_test.txt",col.names = "activity_no")
    activity_test<-merge(activity_test_interim,activity_list,by.x="activity_no",by.y="activity_no")
    activity_test$primaryID<-seq.int(nrow(activity_test))
    activity_test$activity_no<-NULL
    
    #X_test file
    
    total_observations_test<-read.table("./test/X_test.txt",col.names=variables_561_vector)
    total_observations_test$primaryID<-seq.int(nrow(total_observations_test))
    
    #merging activity, subject and total observations datasets
    activity_subject_test<-merge(activity_test,subject_test,by.x="primaryID",by.y="primaryID")
    total_observations_test<-merge(activity_subject_test,total_observations_test,by.x="primaryID",by.y="primaryID")
    
    
    ###########Inertial Signals - body_acc_x_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_acc_x_meanvalue","body_acc_x_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_acc_x_test",i,sep="")
    }
    
    body_acc_x_test<-read.table("./test/Inertial Signals/body_acc_x_test.txt",col.names=name_list1)
    body_acc_x_test$body_acc_x_meanvalue<-rowMeans(body_acc_x_test[,1:128])
    for(j in 1:128)
      
    {
      body_acc_x_test$body_acc_x_sdvalue[j]<-sd(as.numeric(body_acc_x_test[j,1:128]))
    }
    
    body_acc_x_test$primaryID<-seq.int(nrow(body_acc_x_test))
    body_acc_x_test<-body_acc_x_test[keep_list]
    
    
    ###########Inertial Signals - body_acc_y_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_acc_y_meanvalue","body_acc_y_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_acc_y_test",i,sep="")
    }
    
    body_acc_y_test<-read.table("./test/Inertial Signals/body_acc_y_test.txt",col.names=name_list1)
    body_acc_y_test$body_acc_y_meanvalue<-rowMeans(body_acc_y_test[,1:128])
    for(j in 1:128)
      
    {
      body_acc_y_test$body_acc_y_sdvalue[j]<-sd(as.numeric(body_acc_y_test[j,1:128]))
    }
    
    body_acc_y_test$primaryID<-seq.int(nrow(body_acc_y_test))
    body_acc_y_test<-body_acc_y_test[keep_list]
    
    ###########Inertial Signals - body_acc_z_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_acc_z_meanvalue","body_acc_z_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_acc_z_test",i,sep="")
    }
    
    body_acc_z_test<-read.table("./test/Inertial Signals/body_acc_z_test.txt",col.names=name_list1)
    body_acc_z_test$body_acc_z_meanvalue<-rowMeans(body_acc_z_test[,1:128])
    for(j in 1:128)
      
    {
      body_acc_z_test$body_acc_z_sdvalue[j]<-sd(as.numeric(body_acc_z_test[j,1:128]))
    }
    
    body_acc_z_test$primaryID<-seq.int(nrow(body_acc_z_test))
    body_acc_z_test<-body_acc_z_test[keep_list]
    
    ###########Inertial Signals - body_gyro_x_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_gyro_x_meanvalue","body_gyro_x_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_gyro_x_test",i,sep="")
    }
    
    body_gyro_x_test<-read.table("./test/Inertial Signals/body_gyro_x_test.txt",col.names=name_list1)
    body_gyro_x_test$body_gyro_x_meanvalue<-rowMeans(body_gyro_x_test[,1:128])
    for(j in 1:128)
      
    {
      body_gyro_x_test$body_gyro_x_sdvalue[j]<-sd(as.numeric(body_gyro_x_test[j,1:128]))
    }
    
    body_gyro_x_test$primaryID<-seq.int(nrow(body_gyro_x_test))
    body_gyro_x_test<-body_gyro_x_test[keep_list]
    
    ###########Inertial Signals - body_gyro_y_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_gyro_y_meanvalue","body_gyro_y_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_gyro_y_test",i,sep="")
    }
    
    body_gyro_y_test<-read.table("./test/Inertial Signals/body_gyro_y_test.txt",col.names=name_list1)
    body_gyro_y_test$body_gyro_y_meanvalue<-rowMeans(body_gyro_y_test[,1:128])
    for(j in 1:128)
      
    {
      body_gyro_y_test$body_gyro_y_sdvalue[j]<-sd(as.numeric(body_gyro_y_test[j,1:128]))
    }
    
    body_gyro_y_test$primaryID<-seq.int(nrow(body_gyro_y_test))
    body_gyro_y_test<-body_gyro_y_test[keep_list]
    
    ###########Inertial Signals - body_gyro_z_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","body_gyro_z_meanvalue","body_gyro_z_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("body_gyro_z_test",i,sep="")
    }
    
    body_gyro_z_test<-read.table("./test/Inertial Signals/body_gyro_z_test.txt",col.names=name_list1)
    body_gyro_z_test$body_gyro_z_meanvalue<-rowMeans(body_gyro_z_test[,1:128])
    for(j in 1:128)
      
    {
      body_gyro_z_test$body_gyro_z_sdvalue[j]<-sd(as.numeric(body_gyro_z_test[j,1:128]))
    }
    
    body_gyro_z_test$primaryID<-seq.int(nrow(body_gyro_z_test))
    body_gyro_z_test<-body_gyro_z_test[keep_list]
    
    ###########Inertial Signals - total_acc_x_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","total_acc_x_meanvalue","total_acc_x_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("total_acc_x_test",i,sep="")
    }
    
    total_acc_x_test<-read.table("./test/Inertial Signals/total_acc_x_test.txt",col.names=name_list1)
    total_acc_x_test$total_acc_x_meanvalue<-rowMeans(total_acc_x_test[,1:128])
    for(j in 1:128)
      
    {
      total_acc_x_test$total_acc_x_sdvalue[j]<-sd(as.numeric(total_acc_x_test[j,1:128]))
    }
    
    total_acc_x_test$primaryID<-seq.int(nrow(total_acc_x_test))
    total_acc_x_test<-total_acc_x_test[keep_list]
    
    ###########Inertial Signals - total_acc_y_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","total_acc_y_meanvalue","total_acc_y_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("total_acc_y_test",i,sep="")
    }
    
    total_acc_y_test<-read.table("./test/Inertial Signals/total_acc_y_test.txt",col.names=name_list1)
    total_acc_y_test$total_acc_y_meanvalue<-rowMeans(total_acc_y_test[,1:128])
    for(j in 1:128)
      
    {
      total_acc_y_test$total_acc_y_sdvalue[j]<-sd(as.numeric(total_acc_y_test[j,1:128]))
    }
    
    total_acc_y_test$primaryID<-seq.int(nrow(total_acc_y_test))
    total_acc_y_test<-total_acc_y_test[keep_list]
    
    ###########Inertial Signals - total_acc_z_test
    
    ##file_list<-list.files("./test/Inertial Signals")
    
    #columns to keep - List
    keep_list<-c("primaryID","total_acc_z_meanvalue","total_acc_z_sdvalue")
    
    
    name_list1<-character()
    for(i in 1:128)
    {
      name_list1[i]<-paste("total_acc_z_test",i,sep="")
    }
    
    total_acc_z_test<-read.table("./test/Inertial Signals/total_acc_z_test.txt",col.names=name_list1)
    total_acc_z_test$total_acc_z_meanvalue<-rowMeans(total_acc_z_test[,1:128])
    for(j in 1:128)
      
    {
      total_acc_z_test$total_acc_z_sdvalue[j]<-sd(as.numeric(total_acc_z_test[j,1:128]))
    }
    
    total_acc_z_test$primaryID<-seq.int(nrow(total_acc_z_test))
    total_acc_z_test<-total_acc_z_test[keep_list]
    
    #merging starts within the inertial signals files
    body_acc_xy_test<-merge(body_acc_x_test,body_acc_y_test,by.x="primaryID",by.y="primaryID")
    body_acc_xyz_test<-merge(body_acc_xy_test,body_acc_z_test,by.x="primaryID",by.y="primaryID")
    
    body_gyro_xy_test<-merge(body_gyro_x_test,body_gyro_y_test,by.x="primaryID",by.y="primaryID")
    body_gyro_xyz_test<-merge(body_gyro_xy_test,body_gyro_z_test,by.x="primaryID",by.y="primaryID")
    
    total_acc_xy_test<-merge(total_acc_x_test,total_acc_y_test,by.x="primaryID",by.y="primaryID")
    total_acc_xyz_test<-merge(total_acc_xy_test,total_acc_z_test,by.x="primaryID",by.y="primaryID")
    
    body_acc_gyro_xyz_test<-merge(body_acc_xyz_test,body_gyro_xyz_test,by.x="primaryID",by.y="primaryID")
    body_acc_gyro_total_xyz_test<-merge(body_acc_gyro_xyz_test,total_acc_xyz_test,by.x="primaryID",by.y="primaryID")
    
    #merging final inertial signals and total observations merged files
    total_observations_test<-merge(total_observations_test,body_acc_gyro_total_xyz_test,by.x="primaryID",by.y="primaryID")
    
    for(i in 1:nrow(total_observations_test))
    {
      total_observations_test$subject_category="test"
      total_observations_test$primaryID[i]=paste(total_observations_test$primaryID[i],"test",sep="_")
    }
    
    #merging both sets of total observations
    
    final_merged_set<-merge(total_observations_train,total_observations_test,all.x=TRUE,all.y = TRUE)
    
    #assigning a unique ID for each subject no and activity label pair
    
    rm(i)
    for(i in 1:nrow(final_merged_set))
    {
      final_merged_set$subject_activity_category[i]<-paste(final_merged_set$subject_no[i],final_merged_set$activity_label[i],sep="_")
    }
    
    #group_by the unique subject_activity value pairing
    library(dplyr)
    final_merged_set_DT<-tbl_df(final_merged_set)
    tidy_set_group<-group_by(final_merged_set_DT,subject_activity_category)
    
    #create unique tidy data set - removing the non-essential columns 
    
    tidy_set<-summarise_each_(tidy_set_group,funs(mean),names(tidy_set_group[-(1:3)]))
    tidy_set$subject_category<-NULL
    write.table(tidy_set,"./final_tidy_set.txt",row.names = FALSE)
    
    