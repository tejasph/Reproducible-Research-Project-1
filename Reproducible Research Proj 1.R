#Project 1 Script Drawing Board (not to be published?)
library(dplyr)
library(ggplot2)
setwd("~/R Material/Coursera/Course 5 Reproducible Research/Week 1/repdata_data_activity")

#Functions:
ReadFile <- function(){
      return(read.csv("activity.csv", colClasses = c("integer","Date", "integer"),
                      col.names = c("Steps", "Date", "Interval")))
}

StepSumPerDay <- function(ActivityFrame){
      #filter out rows with NA values
      ActivityFrame <- filter(ActivityFrame, is.na(Steps) == FALSE) %>% group_by(Date) %>%
            summarise(sum(Steps))
      
      names(ActivityFrame) <- c("Date", "StepTotal")
      ActivityFrame
}
#currently unused
StepTotalHist <- function(StepTotalFrame){
      g <- ggplot(data = StepTotalFrame, aes(StepTotal)) + geom_histogram()
      return(g)
}

CalculateMean <- function(StepVector){
      MeanSteps <- mean(StepVector)
}

CalculateMedian <- function(StepVector){
      MedianSteps <- median(StepVector)
}

#Main:

#Task 1: Read in Data and Process
ActivityFile <- ReadFile()
View(ActivityFile)

#Task 2:Find and plot total steps per day using histogram
TotalSteps <- StepSumPerDay(ActivityFile)

#Task 3: Calculate the mean and median of the total steps taken per day. 
StepMean <- CalculateMean(TotalSteps$StepTotal)
StepMedian <- CalculateMedian(TotalSteps$StepTotal)
