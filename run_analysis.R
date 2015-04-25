##
##Data Loading
##
setwd("~/Study/coursera/getting and cleaning data/UCI HAR Dataset")

#Loading Information Set
act_lab<-read.table("activity_labels.txt",header=FALSE)
features<-read.table("features.txt",header=FALSE)

#Loading Test Set
test<-read.table("X_test.txt",header=FALSE)
sub_test<-read.table("subject_test.txt",header=FALSE)
y_test<-read.table("y_test.txt",header=FALSE)

#Loading Training Set
training<-read.table("X_train.txt",header=FALSE)
sub_train<-read.table("subject_train.txt",header=FALSE)
y_train<-read.table("y_train.txt",header=FALSE)

##
##Data Merging
##

if(!require("dplyr")) 
{
      install.packages("dplyr")
}
library(dplyr)

#Row Combine
data_subject_temp<-rbind(sub_train,sub_test)
data_y_temp<-rbind(y_train,y_test)
data_temp<-rbind(training,test)

##
##Label the Data Set
##

#Rename Each Column With Features Names
colnames(data_temp)<-paste(features[,2])

#Column Combine
data_master<-cbind(data_subject_temp,data_y_temp,data_temp)

#Add Column Name
colnames(data_master)[1]<-paste("Subject")
colnames(data_master)[2]<-paste("Activity")

##
##Data Extracting
##

data_master<-tbl_df(data_master)
colnames(data_master)<-make.names(colnames(data_master),unique=T)
data_master_temp1<-select(data_master,Subject,Activity,contains("mean"),contains("std"),-contains("Freq"),-contains("angle"))

#Merge activities names into the data_master_temp1 file
data_master_temp1<-tbl_df(data_master_temp1)

#Sort and Group data
data_master_temp2<-arrange(data_master_temp1,Subject,Activity)
data_master_temp3<-data_master_temp2%>%group_by(Subject, Activity)%>%summarise_each(funs(mean))

##
##Name Activities
##

#Attach the descriptive activity names 
data_master_final<-merge(data_master_temp3,act_lab,by.x="Activity",by.y="V1",all=T)

#Rename the activitiy description column
colnames(data_master_final)[dim(data_master_final)[2]]<-paste("Act_Des")

##
##Create Tidy Data
##

#Re-Arrange the final dataset
data_master_final<-arrange(data_master_final,Subject,Activity)

#Write out the data
write.table(data_master_final, "~/Study/coursera/getting and cleaning data/UCI HAR Dataset/Tidydata.txt",row.name=FALSE)


