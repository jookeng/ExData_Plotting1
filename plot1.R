library(lubridate)

# Read and modify data
data = read.table("household_power_consumption.txt", sep = ";", 
                  stringsAsFactor = FALSE, 
                  header = TRUE)

data = data[(data$Date == "1/2/2007")| (data$Date == "2/2/2007") ,]
data$date = dmy_hms(paste(data$Date,data$Time, sep = ' '))
data$Global_active_power = as.numeric(data$Global_active_power)


# Plot 1
png(filename = "plot1.png", 
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")

hist(data$Global_active_power, 
     col = 'red',
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
