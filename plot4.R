data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
newdat <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
newdat$Date <- as.Date(newdat$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(newdat$Date), newdat$Time)
newdat$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(newdat, {
      plot(Global_active_power~Datetime, type="l", 
           ylab="Global Active Power (kilowatts)", xlab="")
      plot(Voltage~Datetime, type="l", 
           ylab="Voltage (volt)", xlab="datetime")
      plot(Sub_metering_1~Datetime, type="l", 
           ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')
      legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             lty=1,col=c("black","red","blue"),cex = 0.5,bty="n")
      plot(Global_reactive_power~Datetime, type="l", 
           ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
