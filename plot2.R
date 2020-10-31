data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
newdat <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
newdat$Date <- as.Date(newdat$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(newdat$Date), newdat$Time)
newdat$Datetime <- as.POSIXct(datetime)

with(newdat, {
      plot(Global_active_power~Datetime, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
