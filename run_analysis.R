#read all files and load to R
#test data
  # read data
subjtest <- read.table("subject_test.txt")
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
  # assign column names
colnames(subjtest) <- c("Subject")
    # read column names from file
feat <- read.table("features.txt")
colnames(xtest) <- feat[,"V2"]
colnames(ytest) <- c("Activity")
  # merge test data
testD <- cbind(subjtest,ytest,xtest)

#train data
  #read data
subjtrain <- read.table("subject_train.txt")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
  # assign column names
colnames(subjtrain) <- c("Subject")
colnames(xtrain) <- feat[,"V2"]
colnames(ytrain) <- c("Activity")
  #merge train data
trainD <- cbind(subjtrain, ytrain, xtrain)

######(1) Merge test and train data to create one data set######
mergeD <- rbind(trainD, testD)

# reshape data 
mdata <- melt(mergeD, id=c("Subject", "Activity"))

#subset data to just get means and std's per measurement
meanstd <- subset(mdata, grepl("(mean*)|(std*)", mdata$variable))

#Get means of subject and activity
subact_means <- cast(meanstd, Subject + Activity ~ variable, mean)

#descriptive activity names
ndata <- subact_means
ndata$Activity[ndata$Activity==6] <- "Laying"
ndata$Activity[ndata$Activity==5] <- "Standing"
ndata$Activity[ndata$Activity==4] <- "Sitting"
ndata$Activity[ndata$Activity==3] <- "Walking Downstairs"
ndata$Activity[ndata$Activity==2] <- "Walking Upstairs"
ndata$Activity[ndata$Activity==1] <- "Walking"

#View table
View(ndata)
