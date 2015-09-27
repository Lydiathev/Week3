##Step 1
##Read test data
test<-read.table("test/x_test.txt")
## Read train data
train<-read.table("train/x_train.txt")
##Create empty data frame for combined test and train data
all_data<-data.frame()
##Combine test and train data in empty data frame
all_data<-rbind(all_data, test,train)

##Read test labels
test_label<-read.table("test/y_test.txt")
##Read train labels
train_label<-read.table("train/y_train.txt")
##Create empty data frame for combined test and train labels
all_data_labels<-data.frame()
##Combine test and train labels
all_data_labels<-rbind(all_data_labels, test_label, train_label)

##Read test subject
test_subject<-read.table("test/subject_test.txt")
##Read train subject
train_subject<-read.table("train/subject_train.txt")
##Create empty data frame for combined test and train subjects
all_data_subjects<-data.frame()
##Combine test and train subjects
all_data_subjects<-rbind(all_data_subjects, test_subject,train_subject)
names(all_data_subjects)<-"subject"

##Read features attributes
features<-read.table("features.txt", col.names = c("ID","features"))

##Read activity labels
activity<-read.table("activity_labels.txt",col.names = c("ID","activity"))

##Step2
##create function that can be used to filter mean and sd data
mean_sd<-function(){
        features
        features_mean_sd<=grep('mean\\(\\)|sd\\(\\)',features$features)
        data_mean_sd<-all_data[,features_mean_sd]
        headings(data_mean_sd)<-features[features$ID %in% features_mean_sd]
        data_mean_sd
}
##Step3 & 4
##Assign dataset with activity labels and variable names
new_dataset<-merge(all_data_labels, activity, by="ID")

new_dataset<-data.frame()
new_dataset<-rbind(new_dataset, all_data_subjects, all_data)

write.table(new_dataset, "new_data.txt")

##Step 5
##Create a new tidy dataset with the average of each variable for each activity and subject
