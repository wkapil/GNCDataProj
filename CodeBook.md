The source data set represents data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set archive can be downloaded from:

Data Set URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Source Files

The source files we use to create the tidy data set from the extrated data archive are:

* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

NOTE: We do not use the Inertial Signals for this tidy data set.

## Variables

Variables within the tidy data set are as examined as follows (taken from [1]).

The activity labels consist of 
*walking
*walkingupstairs
*walkingdownstairs
*sitting
*standing
*laying

The subjects who carried out the experiment are represented as a number from 1 to 30. For each measurement the mean, stddev, and mean frequency were calculated.

