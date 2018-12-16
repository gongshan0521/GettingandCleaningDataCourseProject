# CodeBook for Getting and Cleaning Data Course Project

The dataset that this codebook pertains is in 'tidydata.txt' with location "./FUCI HAR Dataset/UCI HAR Dataset/tidy/tidydata.txt".

The data structure of the dataset is illustrated in [Data Structure](#datastructure). Variable list and corresponding explanations are given in [Vairables](#variables). And the transformations that were performed in 'run_analysis.R' are presented in [Transformation](#transformation).

## Data Structure [#datastructure]
The 'tidydata.txt' file is the final text file produced by 'run_analysis.R', with values separated by tab.

The first row contains the name of the variables, (refer to section [Variables Definition](#variablesdefinition) for details), and the rest rows are the values corresponding to each variable.

## Variables Definition <a name="variablesdefinition"></a>
The dataset contains 81 variables: activity, subject and 79 averaged signal measurement.

### Identifiers <a name="identifiers"></a>
* 'activity'
    
    String with 6 possible values:

    * WALKING: subject was walking during test
    * WALKING_UPSTAIRS: subject was walking upstairs during test
    * WALKING_DOWNSTAIRS: subject was walking downstairs during test
    * SITTING: subject was sitting during test
    * STANDING: subject was standing during test
    * LAYING: subject was laying during test

* 'subject'
    
    Integer, ranges from 1 to 30: referring to 30 test subjects

### Variables <a name="variables"></a>
These measurements are classified into two domains
* Time Domain Signals
    * Mean of time domain body acceleration in X, Y and Z directions:
        * timeDomainBodyAccMeanX
        * timeDomainBodyAccMeanY
        * timeDomainBodyAccMeanZ
    * Standard deviation of time domain body acceleration in X, Y and Z directions:
        * timeDomainBodyAccStdX
        * timeDomainBodyAccStdY
        * timeDomainBodyAccStdZ
    * Mean of time domain gravity acceleration in X, Y and Z directions:
        * timeDomainGravityAccMeanX
        * timeDomainGravityAccMeanX
        * timeDomainGravityAccMeanX
    * Standard deviation of time domain gravity acceleration in X, Y and Z directions:
        * timeDomainGravityAccStdX
        * timeDomainGravityAccStdY
        * timeDomainGravityAccStdZ
    * Mean of time domain body acceleration jerk in X, Y and Z directions:
        * timeDomainBodyAccJerkMeanX
        * timeDomainBodyAccJerkMeanY
        * timeDomainBodyAccJerkMeanZ
    * Standard deviation of time domain body acceleration jerk in X, Y and Z directions:
        * timeDomainBodyAccJerkStdX
        * timeDomainBodyAccJerkStdY
        * timeDomainBodyAccJerkStdZ
    * Mean of time domain body angular velocity in X, Y and Z directions:
        * timeDomainBodyGyroMeanX
        * timeDomainBodyGyroMeanY
        * timeDomainBodyGyroMeanZ
    * Standard deviation of time domain body angular velocity in X, Y and Z directions:
        * timeDomainBodyGyroStdX
        * timeDomainBodyGyroStdY
        * timeDomainBodyGyroStdZ
    * Mean of time domain body angular velocity jerk in X, Y and Z directions:
        * timeDomainBodyGyroJerkMeanX
        * timeDomainBodyGyroJerkMeanY
        * timeDomainBodyGyroJerkMeanZ
    * Standard deviation of time domain body angular velocity jerk in X, Y and Z directions:
        * timeDomainBodyGyroJerkStdX
        * timeDomainBodyGyroJerkStdY
        * timeDomainBodyGyroJerkStdZ
    * Mean of time domain magnitude of body acceleration:
        * timeDomainBodyAccMagMean
    * Standard deviation of time domain magnitude of body acceleration:
        * timeDomainBodyAccMagStd
    * Mean of time domain magnitude of gravity acceleration:
        * timeDomainGravityAccMagMean
    * Standard deviation of time domain magnitude of gravity acceleration:
        * timeDomainGravityAccMagStd
    * Mean of time domain magnitude of body acceleration jerk:
        * timeDomainBodyAccJerkMagMean
    * Standard deviation of time domain magnitude of body acceleration jerk:
        * timeDomainBodyAccJerkMagStd
    * Mean of time domain magnitude of body angular velocity:
        * timeDomainBodyGyroMagMean
    * Standard deviation of time domain magnitude of body angular velocity:
        * timeDomainBodyGyroMagStd
    * Mean of time domain magnitude of body angular velocity jerk:
        * timeDomainBodyGyroJerkMagMean
    * Standard deviation of time domain magnitude of body angular velocity jerk:
        * timeDomainBodyGyroJerkMagStd
* Frequency Domain Signals
    * Mean of frequency domain body acceleration in X, Y and Z directions:
        * frequencyDomainBodyAccMeanX
        * frequencyDomainBodyAccMeanY
        * frequencyDomainBodyAccMeanZ
    * Standard deviation of frequency domain body acceleration in X, Y and Z directions:
        * frequencyDomainBodyAccStdX
        * frequencyDomainBodyAccStdY
        * frequencyDomainBodyAccStdZ
    * Mean of frequency-component of frequency domain body acceleration in X, Y and Z directions:
        * frequencyDomainBodyAccMeanFreqX
        * frequencyDomainBodyAccMeanFreqY
        * frequencyDomainBodyAccMeanFreqZ
    * Mean of frequency domain body acceleration jerk in X, Y and Z directions:
        * frequencyDomainBodyAccJerkMeanX
        * frequencyDomainBodyAccJerkMeanY
        * frequencyDomainBodyAccJerkMeanZ
    * Standard deviation of frequency domain body acceleration jerk in X, Y and Z directions:
        * frequencyDomainBodyAccJerkStdX
        * frequencyDomainBodyAccJerkStdY
        * frequencyDomainBodyAccJerkStdZ
    * Mean of frequency-component of frequency domain body acceleration jerk in X, Y and Z directions:
        * frequencyDomainBodyAccJerkMeanFreqX
        * frequencyDomainBodyAccJerkMeanFreqY
        * frequencyDomainBodyAccJerkMeanFreqZ
    * Mean of frequency domain body angular velocity in X, Y and Z direction:
        * frequencyDomainBodyGyroMeanX
        * frequencyDomainBodyGyroMeanY
        * frequencyDomainBodyGyroMeanZ
    * Standard deviation of frequency domain body angular velocity in X, Y and Z direction:
        * frequencyDomainBodyGyroStdX
        * frequencyDomainBodyGyroStdY
        * frequencyDomainBodyGyroStdZ
    * Mean of frequency-component of frequency domain body angular velocity in X, Y and Z direction:
        * frequencyDomainBodyGyroMeanFreqX
        * frequencyDomainBodyGyroMeanFreqY
        * frequencyDomainBodyGyroMeanFreqZ
    * Mean of frequency domain magnitude of body acceleration:
        * frequencyDomainBodyAccMagMean
    * Standard deviation of frequency domain magnitude of body acceleration:
        * frequencyDomainBodyAccMagStd
    * Mean of frequency-component of frequency domain magnitude of body acceleration:
        * frequencyDomainBodyAccMagMeanFreq
    * Mean of frequency domain magnitude of body acceleration jerk :
        * frequencyDomainBodyAccJerkMagMean
    * Standard deviation of frequency domain magnitude of body acceleration jerk:
        * frequencyDomainBodyAccJerkMagStd
    * Mean of frequency component of frequency domain magnitude of body acceleration jerk:
        * frequencyDomainBodyAccJerkMagMeanFreq
    * Mean of frequency domain magnitude of body angular velocity:
        * frequencyDomainBodyGyroMagMean
    * Standard deviation of frequency domain magnitude of body angular velocity:
        * frequencyDomainBodyGyroMagStd
    * Mean of frequency component of frequency domain magnitude of body angular velocity:
        * frequencyDomainBodyGyroMagMeanFreq
    * Mean of frequency domain magnitude of body angular velocity jerk:
        * frequencyDomainBodyGyroJerkMagMean
    * Standard deviation of frequency domain magnitude of body angular velocity jerk:
        * frequencyDomainBodyGyroJerkMagStd
    * Mean of frequency component of frequency domain magnitude of body angular velocity jerk:
        * frequencyDomainBodyGyroJerkMagMeanFreq

## Transformation <a name="transformation"></a>
1. Merges the training and the test sets to create one data set.
    * Reading the raw dataset from train folder and test folder.
    * Reconstruct the train dataset and test dataset adding variables of "subject" and "activity".
    * Merge train dataset and test dataset by activity and then subject.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
    * Extract the values corresponding to variables containing mean or std.
3. Uses descriptive activity names to name the activities in the data set
    * The activities index was replaced with one of six strings in section [Identifiers](#identifiers)
4. Appropriately labels the data set with descriptive variable names, using the following rules:
    * The initial letter of each variable name, t and f, were replaced by timeDomain and frequencyDomain respectively.
    * The mean and std were replaced by Mean and Std respectively.
    * Acc, Gyro, Mag, Freq were left untouched as their meaning are quite self-evident
    * Some of the variable names contain BodyBody, and those were replaced by Body
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.