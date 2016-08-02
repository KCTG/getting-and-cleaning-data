# README
## Analyis File
This demonstrates getting and cleaning test and train data used for analysis on wearable computing. Data was downloaded and loaded into R.

Data had two categories - test and train. The script, run_analysis.R, fulfills the following:

1. Merges the training and the test sets to create one data set.

```{r}
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
```

2. Extracts only the measurements on the mean and standard deviation for each measurement.
```{r}
# reshape data 
mdata <- melt(mergeD, id=c("Subject", "Activity"))
#subset data to just get means and std's per measurement
meanstd <- subset(mdata, grepl("(mean*)|(std*)", mdata$variable))
```
3. Uses descriptive activity names to name the activities in the data set
```{r}
#descriptive activity names
ndata <- subact_means
ndata$Activity[ndata$Activity==6] <- "Laying"
ndata$Activity[ndata$Activity==5] <- "Standing"
ndata$Activity[ndata$Activity==4] <- "Sitting"
ndata$Activity[ndata$Activity==3] <- "Walking Downstairs"
ndata$Activity[ndata$Activity==2] <- "Walking Upstairs"
ndata$Activity[ndata$Activity==1] <- "Walking"
```

4. Appropriately labels the data set with descriptive variable names.
```{r}
# Fulfiiled in item 1
```
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```{r}
#Get means of subject and activity
subact_means <- cast(meanstd, Subject + Activity ~ variable, mean)
```
