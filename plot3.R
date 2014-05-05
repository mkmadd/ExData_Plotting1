colclass <- c('character', 'character', 'numeric', 'numeric', 'numeric', 
              'numeric', 'numeric', 'numeric', 'numeric')

full.data <- read.csv('household_power_consumption.txt', sep=';',
                      na.strings='?', colClasses=colclass)


# Combine Date and Time columns into a single datetime column and subset
# on given start and end dates
full.data$datetime <- paste(full.data$Date, full.data$Time)
full.data$datetime <- strptime(full.data$datetime, format='%d/%m/%Y %H:%M:%S')

start.date <- as.POSIXlt('2007-02-01', format='%Y-%m-%d')
end.date <- as.POSIXlt('2007-02-03', format='%Y-%m-%d')

data <- full.data[full.data$datetime >= start.date & 
                      full.data$datetime < end.date, ]
data <- na.omit(data)
rm(full.data)

# Recreate given plot

png('plot3.png')

plot(data$datetime, data$Sub_metering_1, xlab='', ylab='Energy sub metering', type='n')
lines(data$datetime, data$Sub_metering_1, col='black')
lines(data$datetime, data$Sub_metering_2, col='red')
lines(data$datetime, data$Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
