#Exploratory Data Science
#Week 1
#Plot 3

getwd()

setwd(dir = "/Users/User/Documents/Coursera")
library(dplyr)


#Extract 1 Feb 2007 and 2 Feb 2007 data from text file separated by semi-colon and with missing values denoted by "?"
data<-filter(read.csv2("household_power_consumption.txt", sep=";",na.strings="?"),Date=="1/2/2007"|Date=="2/2/2007")

library(lubridate)


#Create a new variable DataTime from Date and Time with format as detailed below
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3<-as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]

#Plot Energy Sub Metering against Day (DateTime)

plot(data$DateTime,data$Sub_metering_1, type="n",xlab=" ", ylab="Energy sub metering") 

lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2,col="red")
lines(data$DateTime, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2)

#Copy image from screen to plot3.png
dev.copy(png,file="plot3.png",width=480, height=480)

dev.off()
