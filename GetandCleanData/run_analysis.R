## download the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

### read into tables

features <- read.table( "features.txt"  , header = FALSE )
activityLabels <- read.table( "activity_labels.txt"  , header = FALSE)
subjectTrain <- read.table("./train/subject_train.txt"   , header = FALSE)
yTr <- read.table("./train/y_train.txt"  , header = FALSE)
xTr <- read.table ("./train/x_train.txt"    , header = FALSE)

## don't forget to read in Test too

subjectTest <-read.table("./test/subject_test.txt"   , header = FALSE)
yTest <- read.table("./test/y_test.txt"   , header = FALSE )
xTest <- read.table("./test/x_test.txt"   , header = FALSE)

## let's give all this data some column names

colnames(activityLabels)<-c("activityId","activityType")
colnames(subjectTrain) <- "subjectId"
colnames(xTr) <- features[,2]
colnames(yTr) <- "activityId"


colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2]
colnames(yTest) <- "activityId"




### put together the Training Data, by column
trainData <- cbind(yTr,subjectTrain,xTr)

### put together the Test Data, by column
testData <- cbind(yTest, subjectTest, xTest)


### combine Training and Test data into one table, by row
allData <- rbind(trainData,testData)


### Let's find some Means and STD Devs

## subset using GREP 

meanstdSubsetdata <- allData[ ,grepl("mean|std|subject|activityId",colnames(allData))]

### describe activity and make nice labels

meanstdSubsetdata <- join(meanstdSubsetdata, activityLabels, by = "activityId", match = "first")
meanstdSubsetdata <- meanstdSubsetdata[,-1]

names(meanstdSubsetdata) <- gsub("\\(|\\)", "", names(meanstdSubsetdata), perl  = TRUE)
names(meanstdSubsetdata) <- gsub("Acc", "Accelerometer", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("^f", "Frequency", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("BodyBody", "Body", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("^t", "Time", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("std", "Standard", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("Freq", "Frequency", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("Mag", "Magnitude", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("mean", "Mean", names(meanstdSubsetdata))
names(meanstdSubsetdata) <- gsub("Gyro", "Gyroscope", names(meanstdSubsetdata))

### Create a tidy table, with the average of each variable for each activity and each subject.


tidydata_meanstd_avg<- ddply(meanstdSubsetdata, c("subjectId","activityType"), numcolwise(mean))

write.table(tidydata_meanstd_avg, file="tidydata.txt", row.names = FALSE)


