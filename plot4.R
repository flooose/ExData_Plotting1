par(bg = 'white')
par(mfcol = c(2,2))

data <- read.csv2('household_power_consumption.txt', na.strings = '?', stringsAsFactors= F)
gap <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
gap$Date <- paste(gap$Date,gap$Time, sep = " ")
gap$Date <- strptime(gap$Date,'%d/%m/%Y %H:%M:%S')

plot(gap$Date, as.numeric(gap$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(gap$Date, as.numeric(gap$Sub_metering_1), type="l", ylab = "Energy sub metering", xlab = "")
points(gap$Date, as.numeric(gap$Sub_metering_2), type="l", col = "red")
points(gap$Date, as.numeric(gap$Sub_metering_3), type="l", col = "blue")

legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(gap$Date, as.numeric(gap$Voltage), type="l", ylab = "Voltage", xlab = "datetime")

plot(gap$Date, as.numeric(gap$Global_reactive_power), type="l", ylab = "Voltage", xlab = "datetime")

dev.copy(png, file= 'plot4.png')
dev.off()
