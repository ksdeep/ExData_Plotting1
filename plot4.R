fileData <- "./data/household_power_consumption.txt"
dataPOL <- read.table(fileData, header=TRUE, sep=";", stringsAsFactors=F, na.strings="?",dec=".")
subData <- dataPOL[dataPOL$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
voltage <- as.numeric(subData$Voltage)
subMtr1 <- as.numeric(subData$Sub_metering_1)
subMtr2 <- as.numeric(subData$Sub_metering_2)
subMtr3 <- as.numeric(subData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMtr1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMtr2, type="l", col="red")
lines(datetime, subMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()