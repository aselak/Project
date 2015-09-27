Created by Adnan Selak on 9/27/2015
How to Run:
Run_Analysis.R will:
1) read in following files:  X_train.txt, Y_train.txt, X_test.txt, Y_test.txt, subject_train.txt, subject_test.txt, activity_labels.txt and features.txt files in working directory.  All items will be loaded as data frames.  Test and Train data frames will be combined into one (full) data set.
2) Columns for full data sets will be  derived from the features.txt file.  Special characters in the names are removed (by using make.names() function).
3) Only columns that have keyword mean or std (case-insensitive, by using tolower() function)  will be used for further processing
4) Data is enriched with subject and activity by being merged with subject(full set) an activity_labels.txt.  Merge was done after data set combining to ensure data is not mangeld during merge.
5) Data is summarized by applying average (mean() function) on target data frame  that is grouped by subject and activity.
results are exported in project.txt file