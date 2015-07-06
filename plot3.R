url <- "/Users/shoubunetou/Desktop/Cousera/household_power_consumption.txt"
data <- read.table(url, sep=";", header=TRUE, na.strings="?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- paste(data$Date, data$Time)
data$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off( )