##  Exploratory Data Analysis - Course Project 1
##  plot4.R
##

## Since the data is a large file, only extract the lines required
hpc_dt <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, 
                     na.strings = "?",skip=66636,nrows=2880,
                     col.names = 
                         colnames(read.table("household_power_consumption.txt",
                                  sep = ";", nrow = 1,header = TRUE)))

## Convert date and time
hpc_dt$Time <- strptime(hpc_dt$Time)
hpc_dt$Date <- as.Date(hpc_dt$Date, "%d/%m/%Y")

## Combine date and time
hpc_dt$dt   <- with(hpc_dt, ymd(Date) + hms(Time))


## Now plot
par(mfrow = c(2,2))

plot(hpc_dt$dt, hpc_dt$Global_active_power, type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts")


plot(hpc_dt$dt, hpc_dt$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(hpc_dt$dt, hpc_dt$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")

points(hpc_dt$dt, hpc_dt$Sub_metering_2, type = "l", col = "red")

points(hpc_dt$dt, hpc_dt$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc_dt$dt, hpc_dt$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

# Now save the plot to a PNG width = 480 height = 480

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()