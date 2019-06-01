Reproducible Research Project 1
================

Introducing the Project
-----------------------

In this project, we will be analyzing an anonymous individual's walking routine over the following time interval: *October 1st 2012 - November 30th 2012*. Specifically, we will assess the number of steps taken over five minute interval measurements.

Reading the CSV file
--------------------

The "activity.csv" file that was provided by Coursera is already relatively easy to work with. I created the following function to read the file into my workspace:

``` r
#set appropriate working directory (location depends on individual)
setwd("~/R Material/Coursera/Course 5 Reproducible Research/Week 1/repdata_data_activity")

#Read in csv file, cleaning up column names and coercing 2nd column into a Date class
ReadFile <- function(){
      return(read.csv("activity.csv", colClasses = c("integer","Date", "integer"),
                      col.names = c("Steps", "Date", "Interval")))
}

ActivityFile <- ReadFile()
head(ActivityFile)
```

    ##   Steps       Date Interval
    ## 1    NA 2012-10-01        0
    ## 2    NA 2012-10-01        5
    ## 3    NA 2012-10-01       10
    ## 4    NA 2012-10-01       15
    ## 5    NA 2012-10-01       20
    ## 6    NA 2012-10-01       25

Before moving onto the assignment questions, we will look at a summary of the data table

``` r
summary(ActivityFile)
```

    ##      Steps             Date               Interval     
    ##  Min.   :  0.00   Min.   :2012-10-01   Min.   :   0.0  
    ##  1st Qu.:  0.00   1st Qu.:2012-10-16   1st Qu.: 588.8  
    ##  Median :  0.00   Median :2012-10-31   Median :1177.5  
    ##  Mean   : 37.38   Mean   :2012-10-31   Mean   :1177.5  
    ##  3rd Qu.: 12.00   3rd Qu.:2012-11-15   3rd Qu.:1766.2  
    ##  Max.   :806.00   Max.   :2012-11-30   Max.   :2355.0  
    ##  NA's   :2304
