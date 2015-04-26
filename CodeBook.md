This codebook will introduce the collecting and cleaning steps of the target data set from raw data to tidy data. The codebook contains the description of the data variables, and the steps of collecting and cleaning processes.

Data source
-------

Original data set: 
>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Original data information: 
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data variables
-------
+ **act_lab**: the list of activities
+ **features**: the list of features
+ **test, sub_test, and y_test**: the data read from X_test.txt, subject_test.txt, and y_text.txt
+ **training, sub_train, and y_train**: the data read from X_train.txt, subject_train.txt, and y_train.txt
+ **data_master**: the original data set of combined data from train and test raw data
+ **data_master_final**: the tidy data set

Data processing
---------
+ Loading data: load the data from original data set
+ Merging data: combine the row data into a data set
+ Labeling data: add the data set with descriptive variable names
+ Extracting data: extract the mean and standard deviation measurement from data set
+ Naming activities: attach the descriptive activity names to the data set
+ Creating tidy data: re-arrange the data set to final data set
+ Writing out the data: write the final data set to document folder
