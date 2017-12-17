#Exploratory Data Science
#Week 1
#Plot 1

getwd()

setwd(dir = "/Users/User/Documents/Coursera")
library(dplyr)

#Extract 1 Feb 2007 and 2 Feb 2007 data from text file separated by semi-colon and with missing values denoted by "?"
data<-filter(read.csv2("household_power_consumption.txt", sep=";",na.strings="?"),Date=="1/2/2007"|Date=="2/2/2007")

#Convert the factor data to numeric data
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]

par(mfrow = c(1, 1))

#Histogram of Global Active Power
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Copy image from screen to plot1.png
dev.copy(png,file="plot1.png",width=480, height=480)

dev.off()