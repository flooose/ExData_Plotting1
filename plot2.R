data <- read.csv2('household_power_consumption.txt', na.strings = '?', stringsAsFactors= F)
gap <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',c(1:3)]
gap$Date <- paste(gap$Date,gap$Time, sep = " ")
gap$Date <- strptime(gap$Date,'%d/%m/%Y %H:%M:%S')

plot(gap$Date, as.numeric(gap$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file= 'plot2.png')
dev.off()
