library(lubridate)



# Read and modify data
data = read.table("household_power_consumption.txt", sep = ";", 
                  stringsAsFactor = FALSE, 
                  header = TRUE)

data = data[(data$Date == "1/2/2007")| (data$Date == "2/2/2007") ,]
data$date = dmy_hms(paste(data$Date,data$Time, sep = ' '))
data$Global_active_power = as.numeric(data$Global_active_power)

# Plot 3
png(filename = "plot3.png", 
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")

plot(data$date,  data$Sub_metering_1,
     type = 'n',
     main = NA,
     xlab = NA,
     ylab = "Energy sub metering")
lines(data$date, data$Sub_metering_1, type = 'l', col = 'black')
lines(data$date, data$Sub_metering_2, type = 'l', col = 'red')
lines(data$date, data$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
