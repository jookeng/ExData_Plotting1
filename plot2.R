library(lubridate)


# Read and modify data
data = read.table("household_power_consumption.txt", sep = ";", 
                  stringsAsFactor = FALSE, 
                  header = TRUE)

data = data[(data$Date == "1/2/2007")| (data$Date == "2/2/2007") ,]
data$date = dmy_hms(paste(data$Date,data$Time, sep = ' '))
data$Global_active_power = as.numeric(data$Global_active_power)


# Plot 2
png(filename = "plot2.png", 
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")
plot2 = plot(data$Global_active_power~data$date, 
             type = 'l',
             col = 'black',
             main = NA,
             xlab = NA,
             ylab = "Global Active Power (kilowatts)"
)
dev.off()
