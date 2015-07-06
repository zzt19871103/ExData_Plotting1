url <- "/Users/shoubunetou/Desktop/Cousera/household_power_consumption.txt"
data <- read.table(url, sep=";", header=TRUE, na.strings="?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- paste(data$Date, data$Time)
data$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(data$DateTime, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
plot(data$DateTime, data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage(volt)")
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global Reactive Power(kilowatts)")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off( )