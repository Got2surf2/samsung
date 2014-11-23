samsung
=======

THE CODE CAN BE RUN IN A DIRECTORY WHERE THE DATA FILES ARE

This is a repo for the Samsung data class project - Data Science Class 3.

This project has been created through R to generate a tidy dataset ready for further analysis.  The original data was split across several different files as follows:


1) Activity list table: Links the class labels with their activity name.
2) Feature list table
3) y data file - indicating the activity the subject was engaged in
4) x data file - measures from the sensors - there are a total of 561 attributes taht were captured or calculated
5) subject file - indicating which subject each row in the x data file was associated with

The program does the following tasks:

1) Combine the test and training data for X, Y and Subject
2) Read in the features and activities tables
3) Limit columns in the X dataset to ones that represent the std and mean
4) Create a new data set that has all the training and test data for only the mean dn asstdev variables
4) Add Subject data to the new data set and then add the activity labels
5) Replace the activity code with a text label 
6) Add names to the column labels for the Activity and Subject columns
7) Melt the data into a tidy dataset and calculate the means by subject/activity/variable
8) generate an output file with th etidy summarized data
