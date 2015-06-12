# Load libraries
library(plyr)

# Read data
data <- read.csv("activity.csv", na.strings=c("NA"))

# Remove NA values
data <- data[is.na(data$steps)==0,]


dailySteps <- ddply(data, .(date), summarize, steps=sum(steps))

intervalSteps <- ddply(data, .(interval), summarize, steps=mean(steps))


str(data)


meanStepsPerInterval <- ddply(data[complete.cases(data),], .(interval), summarize, meanSteps=mean(steps))

data$steps[is.na(data$steps)] <- meanStepsPerInterval[meanStepsPerInterval$interval==data$]
