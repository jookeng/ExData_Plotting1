library(lubridate)



# Read and modify data
data = read.table("household_power_consumption.txt", sep = ";", 
                  stringsAsFactor = FALSE, 
                  header = TRUE)

data = data[(data$Date == "1/2/2007")| (data$Date == "2/2/2007") ,]
data$date = dmy_hms(paste(data$Date,data$Time, sep = ' '))
data$Global_active_power = as.numeric(data$Global_active_power)

# Plot 4
png(filename = "plot4.png", 
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")

par(mfrow = c(2,2), mar = c(4,4,2,1))
# Plot 4.1
plot(data$Global_active_power~data$date, 
     type = 'l',
     col = 'black',
     main = NA,
     xlab = NA,
     ylab = "Global Active Power")

# Plot 4.2
plot(data$Voltage~data$date, 
     type = 'l',
     col = 'black',
     main = NA,
     xlab = "datetime",
     ylab = "Voltage")

# Plot 4.3
plot(data$date, data$Sub_metering_1, 
     type = 'n',
     main = NA,
     xlab = NA,
     ylab = "Energy sub metering")
lines(data$date, data$Sub_metering_1, type = 'l', col = 'black')
lines(data$date, data$Sub_metering_2, type = 'l', col = 'red')
lines(data$date, data$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4.4
plot(data$Global_reactive_power~data$date, 
     type = 'l',
     col = 'black',
     main = NA,
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
par(mfrow = c(1,1))

