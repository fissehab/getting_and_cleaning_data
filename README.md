# getting_and_cleaning_data

This is a repository for the Getting and Cleaning Data Coursera course project through Johns Hopkins University.
Verified certificate available at: https://www.coursera.org/account/accomplishments/records/XUjjn3fNRZ2EZK4y
              <br/>
              <br/>
  
  <strong> Course Project</strong>
     <br/>
  <ul>
  
 <li>Download and unzip the data for this project from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</li>
 
 
 
 <li> After you unzip the downloaded zip file, the folder "UCI HAR Dataset"
 will be created</li>
 
  
 
 <li> Move "run_analysis.R" to "UCI HAR Dataset" </li>
     
 
 <li> After changing working directory into "UCI HAR Dataset", you can run "run_analysis.R" using this command: source(run_analysis.R)</li>
   
    
 
 <li> To read in the cleaned data, which is the average of each variable for each activity and each subject, created for this project in R, use
 tidy <- read.table("merged_and_cleaned_data_average_activity.txt"). 
 </li>
 
 <li>Since there are 30 subjects and 6 activities, tidy is 180*68  as "for each activity and each subject" gives 30 * 6 = 180 rows.</li>
 
 </ul>
