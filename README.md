# Getting Data Final Project


Files:

run_analysis.R - Contains the R script to transform the raw data into a tidy dataset.

CodeBook.md - Discusses how the tidy data differs from the original data.

## Use

To produce the tidy data, simply place the script in the same directory as the zip file containg the original data. Then unzip the original data and run run_analysis.R. The tidy data will be saved as a plain text file, tidy-table.txt.

## Analysis
### Reading the Files

First files containing the feature(colum names) and activity labels are read in. Then each of files for test and train data are read in to thier own variables. 

### Names and Values

The features file represents the column names for both the test and train x values and so where set as such. Next the y values for both the test and train data where converted to a char factor by substiting intergers representing activities with the char vector values from the activity_labels file. The y columns where named activity and the x columns named subject. 

### Test and Train Frames

The training x, y, and subject data were all merged together using cbind. Likewise for the test data.

### Full Data

The full test and train data were then combined into a full data set using rbind.

### Tidy

Only the columns dealing with the standard deviation or mean of some feature where extracted using grep(), plus the subject and activity columns, were extracted from the full data set to create the final data set. In the tidy dataset, each row represents a single experimental trial. The Activity column tells what activity was being performed at each trial and the subject column tells which of the 1-30 subjects performed the trial. The remaining columns specify mean and standard deviation figures on the tracked gyroscop and acceleromiter values.

