getwd()
setwd('/Users/khushi/Desktop/Thapar/5th SEM/DSF/EDA_Coursera/Project1')
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))
dateTime<-paste(data$Date, data$Time)
dateTime<-setNames(dateTime, "DateTime")
dateTime
data<-data[ ,!(names(data) %in% c("Date","Time"))]
data<-cbind(dateTime, data)
data$dateTime<-as.POSIXct(dateTime)

# plot 3
with(data, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
