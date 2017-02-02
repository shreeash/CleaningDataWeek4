### Data Set Information:

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

Check the [README](README.md) file for further details about
this dataset.

A video of the experiment including an example of the 6 recorded
activities with one of the participants can be seen in the following
link: [Human Activity](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

An updated version of this dataset can be found at [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
It includes labels of postural transitions between activities and also
the full raw inertial signals instead of the ones pre-processed into
windows.

### Attribute Information:

For each record in the dataset it is provided: - Triaxial acceleration
from the accelerometer (total acceleration) and the estimated body
acceleration. - Triaxial Angular velocity from the gyroscope. - A
561-feature vector with time and frequency domain variables. - Its
activity label. - An identifier of the subject who carried out the
experiment.

Merge the training and the test sets to create one data set.
------------------------------------------------------------

After setting the source directory for the files, read into tables the
data located in

features.txt activity\_labels.txt subject\_train.txt x\_train.txt
y\_train.txt subject\_test.txt x\_test.txt y\_test.txt

Using features.txt and activity\_labels.txt assign column names and
merge train and test datasets to create one data set.

Extract only the measurements on the mean and standard deviation for each measurement.
--------------------------------------------------------------------------------------

Using grep and expression arguments select data with mean and std

Use descriptive activity names to name the activities in the data set
---------------------------------------------------------------------

Using activity\_labels.txt name the columns of the y data set

Appropriately label the data set with descriptive activity names.
-----------------------------------------------------------------

Lables for dataset y and subject is set to ActivityNames and Subject\_ID
respectively.

Create a second, independent tidy data set with the average of each variable for each activity and each subject.
----------------------------------------------------------------------------------------------------------------

Tidy.txt file is created where it contains with average of each
measurement for each activity and each subject.
