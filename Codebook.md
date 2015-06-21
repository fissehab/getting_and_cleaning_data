# getting_and_cleaning_data

This is a cood book that describes the variables, the data and the procedures used to create a tidy data for the Getting and Cleaning Data Coursera course project through Johns Hopkins University.
              <br/>
              <br/>
  
  <strong> Course Project</strong>
     <br/>
 
  
 The Data is project from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 
 
 <mark>The file run_analysis.R does the following to clean up the data:</mark>

 <li> Merges the training (train/X_train.txt) and test (test/X_test.txt) sets to create one data set. This gives a 10299x561 data frame. This is the same as the information in the original description which states that number of instances is 10299" and number of attributes is 561 </li>
 
 <li> Merges the train (train/subject_train.txt) and test (test/subject_test.txt) subjects which gives a 10299x1 data frame. This is subject IDs.</li>
 
 <li> Merges the train (train/y_train.txt) and test (test/y_test.txt) activity IDs a 10299x1 data frame.</li>

 <li> Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. Regular expressions are  used to get the appropriate indices and to replace unwanted characters. This step gives a 10299x66 data frame since only 66 out of 561 attributes are measurements on the mean and standard deviation.</li>
 
 <li> Reads activity_labels.txt, changes the characters to lower case for readability and removes underscore. Then, it applies descriptive activity names to name the activities in the data set. The names of activities are 
 
walking, walkingupstairs, walkingdownstairs, sitting, standing and laying.<li>
 
 
<li>The script run_analysis.R appropriately labels the data set with descriptive names.The script merges the 10299x66 data frame containing the features with the activity labels and subject IDs, which are both 10299x1 data frames. This sttep creates the file "merged_and_cleaned_data.txt". This file a 10299x68 data frame. In "merged_and_cleaned_data.txt" the first column is subject IDs, the second column is activity names, and the last 66 columns are measurements. The names are the following: tbodyacc-mean-x, tbodyacc-mean-y, tbodyacc-mean-z, tbodyacc-std-x,tbodyacc-std-y, tbodyacc-std-z, tgravityacc-mean-x, and tgravityacc-mean-y. Subject IDs are integers between 1 and 30 inclusive.</li>
 
 <li> As a last step of the project, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The file from this step is saves as merged_and_cleaned_data_average_activity.txt. This file is a 180x68 data frame. In this file the first column contains subject IDs, while the second column contains activity names mentioned above,the averages for each of the 66 attributes cover columns three to 68. Since there are 30 subjects and 6 activities, merged_and_cleaned_data_average_activity.txt has 180 rows.</li>