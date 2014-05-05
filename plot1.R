setwd('E:/Coursera/Exploratory Data Analysis')

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

png('plot1.png')

hist(data$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

dev.off()

