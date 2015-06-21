# Getting and Cleaning Data course project
# dataset used for this project:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# set working directory

setwd("C:/Fish/classes/summer_2015/getting_cleaning_data/project")

rm(list=ls())  # clear workspace

# Load required libraries

require(downloader)
library(plyr)

# Download the dataset as Dataset.zip.
# But first check if the folder of unzipped Dataset.zip is present
# else download it.

if (!dir.exists("UCI HAR Dataset")){
        #"UCI HAR Dataset" is the directory created after unzipping Dataset.zip

    url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

    download(url, dest="Dataset.zip") 

    unzip ("Dataset.zip")

}

dir()       # see the list of files and folders

# change directory to "UCI HAR Dataset" which is created
# after unzipping Dataset.zip

setwd("C:/Fish/classes/summer_2015/getting_cleaning_data/project/UCI HAR Dataset")

dir()                # see the list of files and folders   

list.files("./train")    # see contents of the "train" folder 

list.files("./test")     #see contents of the "test" folder


# "README.txt" contains detailed information about the datasets.
# Files in the Inertial Signals folders are not being used here.
# The relationship between the different files used in this analysis 
# is shown in the Figure with the README.md
#  Activity, Subject and Features as part of descriptive variable names 
# for the data frame to be created.

# 1. Merge the training and the test sets to create one data set

X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X <- rbind(X_train, X_test)

dim(X)

y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
Y <- rbind(y_train, y_test)

dim(Y)

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
Subject <- rbind(subject_train, subject_test)

dim(Subject)

Features <- read.table("features.txt")

dim(Features)


# 2.Extracts only the measurements on the mean 
#   and standard deviation for each measurement.


# Now, let's extract only the measurements on the mean and standard deviation
# for each measurement using regular expression functions.

# help(grep) shows us the functions we can use for regular expression in R.

# Let's seacrh the indices of the names that contain-mean() and -std().
# \\ is escape character.

# We are using the function grep to search indices that 
# contain mean() and std() in the Features variable.


indices <- grep("-mean\\(\\)|-std\\(\\)", Features[, 2])
extracted <- X[, indices]

#Let's give name to extracted from Feature.

# Then, let's remove "()" using the regular expression function 
# gsub and change the characters to lower case for readability.

names(extracted) <- Features[indices, 2]
names(extracted) <- gsub("\\(|\\)", "", names(extracted))
names(extracted) <- tolower(names(extracted))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")

# Let's remove "_" in acyivities using the regular expression function gsub 
# and change the characters to lower case for readability.

activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))

Y[,1] = activities[Y[,1], 2]


names(Y) <- "activity"


# 4. Appropriately label the data set with descriptive activity names.

names(Subject) <- "subject"


# Now, let's create a data frame and save it as merged_and_cleaned_data.txt

clean <- cbind(Subject,Y,extracted)

write.table(clean, file="merged_and_cleaned_data.txt",row.name=FALSE)

dim(clean)


# 5 From the data set in step 4, create a second, independent tidy 
# data set with the average of each variable for each activity and 
# each subject.

# We can use the handy function aggregate for this purpose.

clean2<-aggregate(. ~subject + activity, clean, mean)
clean2<-clean2[order(clean2$subject,clean2$activity),]
write.table(clean2, file = "merged_and_cleaned_data_average_activity.txt",row.name=FALSE)

dim(clean2)
