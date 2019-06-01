#Project 1 Script Drawing Board (not to be published?)
library(dplyr)

#Functions:
ReadFile <- function(){
      return(read.csv("activity.csv", colClasses = c("integer","Date", "integer"),
                      col.names = c("Steps", "Date", "Interval")))
}

StepSumPerDay <- function(ActivityFrame){
      #filter out rows with NA values
      ActivityFrame <- filter(ActivityFrame, is.na(Steps) == FALSE) %>% group_by(Date) %>%
            summarise(sum(Steps))
      
      
      
}

#Main:

#Task 1: Read in Data and Process
ActivityFile <- ReadFile()
View(ActivityFile)

#Task 2:Find and plot total steps per day using histogram


print(StepSumPerDay(ActivityFile))
