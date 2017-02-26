# Getting and Cleaning Data Course Project

## Variable Descriptions

The table below describes the data in the summarized dataset **haraverages.txt**.
This data is generated after running the run_analysis.R script on the [HAR data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


| Variable            | Description                                                    | Units                | Original Feature Name |
|---------------------|----------------------------------------------------------------|----------------------|-----------------------|
| subject             | subject number                                                 | NA                   | subject               |
| activity            | activity being performed                                       | NA                   | activity              |
| avgtBodyAccmeanX    | average of mean body acceleration along **x** axis             | normalized to [-1,1] | tBodyAcc-mean()-X     |
| avgtBodyAccmeanY    | average of mean body acceleration along **y** axis             | normalized to [-1,1] | tBodyAcc-mean()-Y     |
| avgtBodyAccmeanZ    | average of mean body acceleration along **z** axis             | normalized to [-1,1] | tBodyAcc-mean()-Z     |
| avgtBodyAccstdX     | average of std dev of  body   acceleration along **x** axis    | normalized to [-1,1] | tBodyAcc-std()-X      |
| avgtBodyAccstdY     | average of std dev of body acceleration along **y** axis       | normalized to [-1,1] | tBodyAcc-std()-Y      |
| avgtBodyAccstdZ     | average of std dev of body acceleration along **z** axis       | normalized to [-1,1] | tBodyAcc-std()-Z      |
| avgtGravityAccmeanX | average of mean of  gravity   acceleration along **x** axis    | normalized to [-1,1] | tGravityAcc-mean()-X  |
| avgtGravityAccmeanY | average of mean of gravity acceleration along **y** axis       | normalized to [-1,1] | tGravityAcc-mean()-Y  |
| avgtGravityAccmeanZ | average of mean of gravity acceleration along **z** axis       | normalized to [-1,1] | tGravityAcc-mean()-Z  |
| avgtGravityAccstdX  | average of std dev of  gravity   acceleration along **x** axis | normalized to [-1,1] | tGravityAcc-std()-X   |
| avgtGravityAccstdY  | average of std dev of gravity acceleration along **y** axis    | normalized to [-1,1] | tGravityAcc-std()-Y   |
| avgtGravityAccstdZ  | average of std dev of gravity acceleration along **z** axis    | normalized to [-1,1] | tGravityAcc-std()-Z   |
| avgtBodyGyromeanX   | average of mean of  gyroscopic   velocity along **x** axis     | normalized to [-1,1] | tBodyGyro-mean()-X    |
| avgtBodyGyromeanY   | average of mean of gyroscopic velocity along **y** axis        | normalized to [-1,1] | tBodyGyro-mean()-Y    |
| avgtBodyGyromeanZ   | average of mean of gyroscopic velocity along **z** axis        | normalized to [-1,1] | tBodyGyro-mean()-Z    |
| avgtBodyGyrostdX    | average of std dev of  gyroscopic   velocity along **x** axis  | normalized to [-1,1] | tBodyGyro-std()-X     |
| avgtBodyGyrostdY    | average of std dev of gyroscopic velocity along **y** axis     | normalized to [-1,1] | tBodyGyro-std()-Y     |
| avgtBodyGyrostdZ    | average of std dev of gyroscopic velocity along **z** axis     | normalized to [-1,1] | tBodyGyro-std()-Z     |
