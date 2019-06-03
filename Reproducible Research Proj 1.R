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

AvgStepsPerInterval <- function(ActivityFrame){
      ActivityFrame <- filter(ActivityFrame, is.na(Steps) == FALSE) %>% group_by(Interval) %>%
            summarise(mean(Steps))
      names(ActivityFrame) <- c("Interval", "StepMean")
      ActivityFrame
}

ImputeMissingValues <- function(StepVector, MeanStepVector){
      for (i in c(1:length(StepVector))){
            if (is.na(StepVector[i])== TRUE){
                  StepVector[i] <- MeanStepVector[i]
            }
          
      }
      StepVector

}

AvgStepWeekday <- function(ActivityFrame){
      ActivityFrame$Date <- weekdays(ActivityFrame$Date)
      DetermineWeekday <-factor(grepl("S.+",as.character(ActivityFrame$Date)), 
                                levels = c(TRUE,FALSE), labels = c("Weekend","Weekday"))
      ActivityFrame <- mutate(ActivityFrame, wDay = DetermineWeekday) %>%
            group_by(wDay,Interval) %>%
            summarise(mean(Steps))
      names(ActivityFrame) <- c("wDay", "Interval","StepMean")
      ActivityFrame
      
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

#Task 4: Time series plot of the avg number of steps taken
MeanStepPerInterval <- AvgStepsPerInterval(ActivityFile)

#Task 6: Method for imputing missing data
MergeFrame <- merge(ActivityFile, MeanStepPerInterval, by = "Interval")
MergeFrame$Steps <- ImputeMissingValues(MergeFrame$Steps, MergeFrame$StepMean)

#Task 8: Avg step per weekday
AvgStepPerWeekday <- AvgStepWeekday(MergeFrame)
