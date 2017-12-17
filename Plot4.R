#Exploratory Data Science
#Week 1
#Plot 4

getwd()

setwd(dir = "/Users/User/Documents/Coursera")
library(dplyr)

data<-filter(read.csv2("household_power_consumption.txt", sep=";",na.strings="?"),Date=="1/2/2007"|Date=="2/2/2007")

par(mfrow = c(2, 2), mar = c(5, 4, 2, 2)) 

library(lubridate)


#Create a new variable DataTime from Date and Time with format as detailed below
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Plot Global Active Power against DateTime
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
with(data,plot(DateTime,Global_active_power,type="l",xlab="datetime", ylab="Global Active Power"))

#Plot Voltage against DateTime
data$Voltage<-as.numeric(levels(data$Voltage))[data$Voltage]
with(data,plot(DateTime,Voltage,type="l",xlab="datetime", ylab="Voltage")) 

#Plot Energy Sub Metering against Day (DateTime)

data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3<-as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]

plot(data$DateTime,data$Sub_metering_1, type="n",xlab=" ", ylab="Energy sub metering") 

lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2,col="red")
lines(data$DateTime, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2)

#Plot Global Reactive Power against DateTime
data$Global_reactive_power<-as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
with(data,plot(DateTime,Global_reactive_power,type="l",xlab="datetime", ylab="Global reactive power")) 

#Copy image from screen to plot4.png
dev.copy(png,file="plot4.png",width=480, height=480)

dev.off()


