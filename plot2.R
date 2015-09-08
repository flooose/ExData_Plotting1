data <- read.csv2('household_power_consumption.txt', na.strings = '?', stringsAsFactors= F)
gap <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',c(1:3)]
#gap$Date <- as.POSIXlt(strftime(paste(gap$Date,gap$Time, sep = " "), '%d/%m/%Y %H:%M:%S'), format='%d/%m/%Y %H:%M:%S')
gap$Date <- paste(gap$Date,gap$Time, sep = " ")
gap$Date <- strptime(gap$Date,'%d/%m/%Y %H:%M:%S')
plot(gap$Date, as.numeric(gap$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)")
#gap$Date <- paste(gap$Date,gap$Time, sep = " ")#, '%d/%m/%Y %H:%M%S')
gap <- gap[gap$Date == 'Thursday' | gap$Date == 'Friday' | gap$Date == 'Saturday',]

#, colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
## hist(as.numeric(gap$Global_active_power),
##      main = "Global Active Power",
##      col = 'red',
##      xlab = "Global Active Power (kilowatts)")
## dev.copy(png, file= 'plot1.png')
## dev.off()