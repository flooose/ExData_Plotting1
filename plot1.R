par(bg = 'white')

data <- read.csv2('household_power_consumption.txt', na.strings = '?', stringsAsFactors= F)
gap <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',c(1,3)]
#, colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
hist(as.numeric(gap$Global_active_power),
     main = "Global Active Power",
     col = 'red',
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file= 'plot1.png')
dev.off()
