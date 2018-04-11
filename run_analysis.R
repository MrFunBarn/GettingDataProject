# Getting Data Final Project.

#     Download the zip file with the data into the same directory as this script,
# then unzip the data and run the script to produce the tidy data set.

# Read in the names of features.
features      <- read.table('UCI HAR Dataset/features.txt')
# Read in the activity labels.
activities    <- read.table('UCI HAR Dataset/activity_labels.txt')

# Read in the test and training Data.
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
x_train       <- read.table('UCI HAR Dataset/train/X_train.txt')
y_train       <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_test  <- read.table('UCI HAR Dataset/test/subject_test.txt')
x_test        <- read.table('UCI HAR Dataset/test/X_test.txt')
y_test        <- read.table('UCI HAR Dataset/test/y_test.txt')

# Set the Column names in the x data.
names(x_train) <- features$V2
names(x_test)  <- features$V2
# Set column names in the subject data vectors.
names(subject_test)  <- c('Subject')
names(subject_train) <- c('Subject')

# Convert y data to activity factor.
y_test        <- sapply(y_test,  function(x) x <- activities$V2[as.numeric(x)])
y_train       <- sapply(y_train, function(x) x <- activities$V2[as.numeric(x)])
y_test        <- data.frame(y_test)
y_train       <- data.frame(y_train)
names(y_test) <- c('Activity')
names(y_train)<- c('Activity')

# Make composite test data.
test <- cbind(subject_test, y_test, x_test)
# Make composite train data.
train <- cbind(subject_train, y_train, x_train)

# Merge the test and train data.
full_data <- rbind(train, test)

# Extract just the columns for mean and std data plus subject and activity.
mean_std_data <- full_data[c(1,2,grep('-std()|-mean()', names(full_data)))]

# Write tidy data to a csv file.
write.csv(file='TidyData.csv', mean_std_data)