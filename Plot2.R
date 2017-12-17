#Exploratory Data Science
#Week 1
#Plot 2

getwd()

setwd(dir = "/Users/User/Documents/Coursera")
library(dplyr)

#Extract 1 Feb 2007 and 2 Feb 2007 data from text file separated by semi-colon and with missing values denoted by "?"
data<-filter(read.csv2("household_power_consumption.txt", sep=";",na.strings="?"),Date=="1/2/2007"|Date=="2/2/2007")

library(lubridate)

#Create a new variable DataTime from Date and Time with format as detailed below
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Plot Global Active Power against DateTime
with(data,plot(DateTime,Global_active_power,ylab="Global Active Power (kilowatts)",xlab=" ",type="l"))

#Copy image from screen to plot2.png
dev.copy(png,file="plot2.png",width=480, height=480)

dev.off()