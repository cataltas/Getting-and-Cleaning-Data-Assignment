#Code written by Camille Taltas 

#Open all the needed files and save them as tables
activities_train<-read.table("./train/y_train.txt")
subjects_train<-read.table("./train/subject_train.txt")
features_train<-read.table("./train/X_train.txt")
feat_names<-read.table("./features.txt")
activities_test<-read.table("./test/y_test.txt")
subjects_test<-read.table("./test/subject_test.txt")
features_test<-read.table("./test/X_test.txt")

#Merge the training and test data sets for the features
merge_features<-rbind(features_train,features_test)

#Rename columns to have descriptive names
colnames(merge_features)<-feat_names$V2

#Keep only the data that has measurements on the mean or standard deviation
extracted_features<-merge_features[,grep("mean|std",names(merge_features))]

#Merge the training and test data sets for subjects and activities
subjects<-rbind(subjects_train,subjects_test)
activities<-rbind(activities_train,activities_test)

#Make the activities have descriptive activity names
activities<-lapply(activities,function(x) gsub(1,"Walking",x))
activities<-lapply(activities,function(x) gsub("2","Walking Upstairs",x))
activities<-lapply(activities,function(x) gsub("3","Walking Downstairs",x))
activities<-lapply(activities,function(x) gsub("4","Sitting",x))
activities<-lapply(activities,function(x) gsub("5","Standing",x))
activities<-lapply(activities,function(x) gsub("6","Laying",x))

#Rename columns to have descriptive names
names(activities)<-"Activity"
names(subjects)<-"Subject"

#Bring all the data together 
complete_data<-cbind(subjects,activities,extracted_features)

#Tidy data in narrow shape
tidy_data<-melt(complete_data,id=c("Subject","Activity"),measure.vars=names(extracted_features))

#Change column names to have descriptive names
names(tidy_data)[3]<-"Feature"

#Compute the mean for each feature for each subject for each activity
data_mean<-dcast(tidy_data,Subject + Activity~ Feature,mean)

#Tidy data for mean values in narrow shape
tidy_data_mean<-melt(data_mean,id=c("Subject","Activity"),measure.vars = names(extracted_features))

#Change column names to have descriptive names
names(tidy_data_mean)[3]<-"Feature"
names(tidy_data_mean)[4]<-"Mean Value"

#Print the tidy data with mean values 
tidy_data_mean

write.table(tidy_data_mean,file="./tidy_data_mean.txt",row.names = FALSE)



