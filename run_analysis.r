# Q1 Merges the training and the test sets to create one data set.
# Import train and test dataset
Xtest <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/test/X_test.txt", quote="\"")
Xtrain <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/train/X_train.txt", quote="\"")
Ytest <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/test/Y_test.txt", quote="\"")
Ytrain <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/train/Y_train.txt", quote="\"")
Stest <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/test/subject_test.txt", quote="\"")
Strain <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/train/subject_train.txt", quote="\"")
# Use rbind to create x,y,subject
X <- rbind(Xtest,Xtrain)
Y <- rbind(Ytest,Ytrain)
subject <- rbind(Stest,Strain)
# Import features.txt.
features <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/features.txt", quote="\"")
# Rename columns of X 
features<-features[,2]
colnames(X,do.NULL=TRUE,prefix="col")
colnames(X)<-features
# Rename columns of Y,subject
names(Y) <- "Y"
names(subject) <- "Subject"
# Merge X,Y,Subject
XY <-cbind(X,Y)
AllData <- cbind(XY,subject)

# Q2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# Use Grep to match pattern mean() and std()
names(AllData)
mean_std <- grep(".*mean.*|.*std.*",names(AllData))
mean_std_Data <- AllData[,mean_std]
mean_std_Data

# Q3 Uses descriptive activity names to name the activities in the data set
activities <- read.table("~/Google Drive/2015- Data Analysis/PROJECT/UCI HAR Dataset/activity_labels.txt")
Activities <- activities[Y[, 1], 2]
Activities
X_activities <- cbind(X,Activities)
update_All <- cbind(X_activities, subject)

# Q4 Appropriately label the data set with descriptive variable names, Already done in Q1
update_All$Subject
update_All$Activities
update_All

# Q5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Still working on it
library(reshape)
All_Melt <- melt(update_All, id = c("subject", "activity"))

