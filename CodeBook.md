# Codebook

All data in this analysis originated from: 

> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.  
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.  
International Workshop of Ambient Assisted Living (IWAAL 2012).  
Vitoria-Gasteiz, Spain. Dec 2012
variables, the data, and any transformations


The variables given in the study include accelerometer and gyroscope 3-axial raw signals, labeled tAcc-XYZ and tGyro-XYZ respectively. These signals correspond to movement from subjects engaging in 6 activities: 

> * Walking 
* Walking Upstairs 
* Walking Downstairs 
* Sitting 
* Standing 
* Laying 


### Data

Per the study, these time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
\

### Transformations 

The data was filtered to just the mean and standard deviation for each measurement. Once summarized to that level, the data was aggregated to the subject and activity level, taking the average of each mean & standard deviation for each subject performing each activity. 

Train and test data were combined, and demarcated with the 'indicator' field, where:

>Indicator = 0 corresponds to train,
and \
Indicator = 1 corresponds to test  


The labels were modified such that abbreviations were spelled out, acording to the following logic: 

| Original Label | New Label |
| --------- | --------- |
| Acc | Accelerometer |
| Gyro   |  Gyroscope |
|  Mag   |  Magnitude |
|  ^t     |     Time |
|  ^f   |  Frequency |
| tBody    |  TimeBody |
|  -mean()    |      Mean |
|   -std()   |     StdDev |
|   -freq()  |   Frequency |
|   angle   |      Angle |
| gravity   |    Gravity |


