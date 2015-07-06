url <- "/Users/shoubunetou/Desktop/Cousera/household_power_consumption.txt"
data <- read.table(url, sep=";", header=TRUE, na.strings="?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- paste(data$Date, data$Time)
data$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off( )
