Getting and Cleaning Data
=================
## Week 4 Project


### This script has the folowing functionality: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

        mean(): Mean value
        std(): Standard deviation
        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
        maxInds(): index of the frequency component with largest magnitude
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        skewness(): skewness of the frequency domain signal 
        kurtosis(): kurtosis of the frequency domain signal 
        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
        angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

        gravityMean
        tBodyAccMean
        tBodyAccJerkMean
        tBodyGyroMean
        tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Total List of Features: 

        1 tBodyAcc-mean()-X
        2 tBodyAcc-mean()-Y
        3 tBodyAcc-mean()-Z
        4 tBodyAcc-std()-X
        5 tBodyAcc-std()-Y
        6 tBodyAcc-std()-Z
        7 tBodyAcc-mad()-X
        8 tBodyAcc-mad()-Y
        9 tBodyAcc-mad()-Z
        10 tBodyAcc-max()-X
        11 tBodyAcc-max()-Y
        12 tBodyAcc-max()-Z
        13 tBodyAcc-min()-X
        14 tBodyAcc-min()-Y
        15 tBodyAcc-min()-Z
        16 tBodyAcc-sma()
        17 tBodyAcc-energy()-X
        18 tBodyAcc-energy()-Y
        19 tBodyAcc-energy()-Z
        20 tBodyAcc-iqr()-X
        21 tBodyAcc-iqr()-Y
        22 tBodyAcc-iqr()-Z
        23 tBodyAcc-entropy()-X
        24 tBodyAcc-entropy()-Y
        25 tBodyAcc-entropy()-Z
        26 tBodyAcc-arCoeff()-X,1
        27 tBodyAcc-arCoeff()-X,2
        28 tBodyAcc-arCoeff()-X,3
        29 tBodyAcc-arCoeff()-X,4
        30 tBodyAcc-arCoeff()-Y,1
        31 tBodyAcc-arCoeff()-Y,2
        32 tBodyAcc-arCoeff()-Y,3
        33 tBodyAcc-arCoeff()-Y,4
        34 tBodyAcc-arCoeff()-Z,1
        35 tBodyAcc-arCoeff()-Z,2
        36 tBodyAcc-arCoeff()-Z,3
        37 tBodyAcc-arCoeff()-Z,4
        38 tBodyAcc-correlation()-X,Y
        39 tBodyAcc-correlation()-X,Z
        40 tBodyAcc-correlation()-Y,Z
        41 tGravityAcc-mean()-X
        42 tGravityAcc-mean()-Y
        43 tGravityAcc-mean()-Z
        44 tGravityAcc-std()-X
        45 tGravityAcc-std()-Y
        46 tGravityAcc-std()-Z
        47 tGravityAcc-mad()-X
        48 tGravityAcc-mad()-Y
        49 tGravityAcc-mad()-Z
        50 tGravityAcc-max()-X
        51 tGravityAcc-max()-Y
        52 tGravityAcc-max()-Z
        53 tGravityAcc-min()-X
        54 tGravityAcc-min()-Y
        55 tGravityAcc-min()-Z
        56 tGravityAcc-sma()
        57 tGravityAcc-energy()-X
        58 tGravityAcc-energy()-Y
        59 tGravityAcc-energy()-Z
        60 tGravityAcc-iqr()-X
        61 tGravityAcc-iqr()-Y
        62 tGravityAcc-iqr()-Z
        63 tGravityAcc-entropy()-X
        64 tGravityAcc-entropy()-Y
        65 tGravityAcc-entropy()-Z
        66 tGravityAcc-arCoeff()-X,1
        67 tGravityAcc-arCoeff()-X,2
        68 tGravityAcc-arCoeff()-X,3
        69 tGravityAcc-arCoeff()-X,4
        70 tGravityAcc-arCoeff()-Y,1
        71 tGravityAcc-arCoeff()-Y,2
        72 tGravityAcc-arCoeff()-Y,3
        73 tGravityAcc-arCoeff()-Y,4
        74 tGravityAcc-arCoeff()-Z,1
        75 tGravityAcc-arCoeff()-Z,2
        76 tGravityAcc-arCoeff()-Z,3
        77 tGravityAcc-arCoeff()-Z,4
        78 tGravityAcc-correlation()-X,Y
        79 tGravityAcc-correlation()-X,Z
        80 tGravityAcc-correlation()-Y,Z
        81 tBodyAccJerk-mean()-X
        82 tBodyAccJerk-mean()-Y
        83 tBodyAccJerk-mean()-Z
        84 tBodyAccJerk-std()-X
        85 tBodyAccJerk-std()-Y
        86 tBodyAccJerk-std()-Z
        87 tBodyAccJerk-mad()-X
        88 tBodyAccJerk-mad()-Y
        89 tBodyAccJerk-mad()-Z
        90 tBodyAccJerk-max()-X
        91 tBodyAccJerk-max()-Y
        92 tBodyAccJerk-max()-Z
        93 tBodyAccJerk-min()-X
        94 tBodyAccJerk-min()-Y
        95 tBodyAccJerk-min()-Z
        96 tBodyAccJerk-sma()
        97 tBodyAccJerk-energy()-X
        98 tBodyAccJerk-energy()-Y
        99 tBodyAccJerk-energy()-Z
        100 tBodyAccJerk-iqr()-X
        101 tBodyAccJerk-iqr()-Y
        102 tBodyAccJerk-iqr()-Z
        103 tBodyAccJerk-entropy()-X
        104 tBodyAccJerk-entropy()-Y
        105 tBodyAccJerk-entropy()-Z
        106 tBodyAccJerk-arCoeff()-X,1
        107 tBodyAccJerk-arCoeff()-X,2
        108 tBodyAccJerk-arCoeff()-X,3
        109 tBodyAccJerk-arCoeff()-X,4
        110 tBodyAccJerk-arCoeff()-Y,1
        111 tBodyAccJerk-arCoeff()-Y,2
        112 tBodyAccJerk-arCoeff()-Y,3
        113 tBodyAccJerk-arCoeff()-Y,4
        114 tBodyAccJerk-arCoeff()-Z,1
        115 tBodyAccJerk-arCoeff()-Z,2
        116 tBodyAccJerk-arCoeff()-Z,3
        117 tBodyAccJerk-arCoeff()-Z,4
        118 tBodyAccJerk-correlation()-X,Y
        119 tBodyAccJerk-correlation()-X,Z
        120 tBodyAccJerk-correlation()-Y,Z
        121 tBodyGyro-mean()-X
        122 tBodyGyro-mean()-Y
        123 tBodyGyro-mean()-Z
        124 tBodyGyro-std()-X
        125 tBodyGyro-std()-Y
        126 tBodyGyro-std()-Z
        127 tBodyGyro-mad()-X
        128 tBodyGyro-mad()-Y
        129 tBodyGyro-mad()-Z
        130 tBodyGyro-max()-X
        131 tBodyGyro-max()-Y
        132 tBodyGyro-max()-Z
        133 tBodyGyro-min()-X
        134 tBodyGyro-min()-Y
        135 tBodyGyro-min()-Z
        136 tBodyGyro-sma()
        137 tBodyGyro-energy()-X
        138 tBodyGyro-energy()-Y
        139 tBodyGyro-energy()-Z
        140 tBodyGyro-iqr()-X
        141 tBodyGyro-iqr()-Y
        142 tBodyGyro-iqr()-Z
        143 tBodyGyro-entropy()-X
        144 tBodyGyro-entropy()-Y
        145 tBodyGyro-entropy()-Z
        146 tBodyGyro-arCoeff()-X,1
        147 tBodyGyro-arCoeff()-X,2
        148 tBodyGyro-arCoeff()-X,3
        149 tBodyGyro-arCoeff()-X,4
        150 tBodyGyro-arCoeff()-Y,1
        151 tBodyGyro-arCoeff()-Y,2
        152 tBodyGyro-arCoeff()-Y,3
        153 tBodyGyro-arCoeff()-Y,4
        154 tBodyGyro-arCoeff()-Z,1
        155 tBodyGyro-arCoeff()-Z,2
        156 tBodyGyro-arCoeff()-Z,3
        157 tBodyGyro-arCoeff()-Z,4
        158 tBodyGyro-correlation()-X,Y
        159 tBodyGyro-correlation()-X,Z
        160 tBodyGyro-correlation()-Y,Z
        161 tBodyGyroJerk-mean()-X
        162 tBodyGyroJerk-mean()-Y
        163 tBodyGyroJerk-mean()-Z
        164 tBodyGyroJerk-std()-X
        165 tBodyGyroJerk-std()-Y
        166 tBodyGyroJerk-std()-Z
        167 tBodyGyroJerk-mad()-X
        168 tBodyGyroJerk-mad()-Y
        169 tBodyGyroJerk-mad()-Z
        170 tBodyGyroJerk-max()-X
        171 tBodyGyroJerk-max()-Y
        172 tBodyGyroJerk-max()-Z
        173 tBodyGyroJerk-min()-X
        174 tBodyGyroJerk-min()-Y
        175 tBodyGyroJerk-min()-Z
        176 tBodyGyroJerk-sma()
        177 tBodyGyroJerk-energy()-X
        178 tBodyGyroJerk-energy()-Y
        179 tBodyGyroJerk-energy()-Z
        180 tBodyGyroJerk-iqr()-X
        181 tBodyGyroJerk-iqr()-Y
        182 tBodyGyroJerk-iqr()-Z
        183 tBodyGyroJerk-entropy()-X
        184 tBodyGyroJerk-entropy()-Y
        185 tBodyGyroJerk-entropy()-Z
        186 tBodyGyroJerk-arCoeff()-X,1
        187 tBodyGyroJerk-arCoeff()-X,2
        188 tBodyGyroJerk-arCoeff()-X,3
        189 tBodyGyroJerk-arCoeff()-X,4
        190 tBodyGyroJerk-arCoeff()-Y,1
        191 tBodyGyroJerk-arCoeff()-Y,2
        192 tBodyGyroJerk-arCoeff()-Y,3
        193 tBodyGyroJerk-arCoeff()-Y,4
        194 tBodyGyroJerk-arCoeff()-Z,1
        195 tBodyGyroJerk-arCoeff()-Z,2
        196 tBodyGyroJerk-arCoeff()-Z,3
        197 tBodyGyroJerk-arCoeff()-Z,4
        198 tBodyGyroJerk-correlation()-X,Y
        199 tBodyGyroJerk-correlation()-X,Z
        200 tBodyGyroJerk-correlation()-Y,Z
        201 tBodyAccMag-mean()
        202 tBodyAccMag-std()
        203 tBodyAccMag-mad()
        204 tBodyAccMag-max()
        205 tBodyAccMag-min()
        206 tBodyAccMag-sma()
        207 tBodyAccMag-energy()
        208 tBodyAccMag-iqr()
        209 tBodyAccMag-entropy()
        210 tBodyAccMag-arCoeff()1
        211 tBodyAccMag-arCoeff()2
        212 tBodyAccMag-arCoeff()3
        213 tBodyAccMag-arCoeff()4
        214 tGravityAccMag-mean()
        215 tGravityAccMag-std()
        216 tGravityAccMag-mad()
        217 tGravityAccMag-max()
        218 tGravityAccMag-min()
        219 tGravityAccMag-sma()
        220 tGravityAccMag-energy()
        221 tGravityAccMag-iqr()
        222 tGravityAccMag-entropy()
        223 tGravityAccMag-arCoeff()1
        224 tGravityAccMag-arCoeff()2
        225 tGravityAccMag-arCoeff()3
        226 tGravityAccMag-arCoeff()4
        227 tBodyAccJerkMag-mean()
        228 tBodyAccJerkMag-std()
        229 tBodyAccJerkMag-mad()
        230 tBodyAccJerkMag-max()
        231 tBodyAccJerkMag-min()
        232 tBodyAccJerkMag-sma()
        233 tBodyAccJerkMag-energy()
        234 tBodyAccJerkMag-iqr()
        235 tBodyAccJerkMag-entropy()
        236 tBodyAccJerkMag-arCoeff()1
        237 tBodyAccJerkMag-arCoeff()2

