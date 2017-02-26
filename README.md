# Getting and Cleaning Data Course Project

This repo includes the following files:
1. Codebook: Describes the variables in the summarized haraverages dataset.
2. run_analysis.R: Script which runs on the HAR dataset to generate the summarized haraverages dataset.
3. haraverages.rda: The summarized dataset obtained after running the run_analysis.R script.

## Analysis Script
This project has just one script viz. **run_analysis.R** which performs the following actions to generate a summary of the HAR data:
1.  Loads the **dplyr** library
2.  Loads names of the activities and features and stores them for future use.
3.  Reads the **test** dataset and stores it into a data frame.
4.  Reads the subject and activity sequence and adds it to data frame created in 3.
5.  Perform steps 3. and 4. on the **train** dataset to generate a train data frame.
6.  Create a joint data frame by combining the test and train data frames.
7.  Generate a vector of indices of columns that we want to extract (mean and std dev of measurements) and work on.
8.  Clean up the variable (column) names to remove any non alpha numeric characters.
9.  Filter out the columns that we want to create a filtered data frame (use the indices vector from 7.).
10. Group the filtered data frame by subject number. Generate a list of subject specific data.
11. Use the custom defined **summarizefun** function to further group each of the subject specific data by activity and then calculate mean.
12. Apply (use lapply) **summarizefun** on all subjects.
13. Massage the "list" of summarized data into a single dataframe.
14. Rearrange columns to make more sense.
15. Save the summarized data frame **haraverages.rda**
