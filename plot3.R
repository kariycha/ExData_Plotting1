##  Exploratory Data Analysis - Course Project 1
##  plot3.R
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


## Now plot for Global Active power Vs DateTime for each sub meter
plot(hpc_dt$dt, hpc_dt$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")

points(hpc_dt$dt, hpc_dt$Sub_metering_2, type = "l", col = "red")

points(hpc_dt$dt, hpc_dt$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Now save the plot to a PNG width = 480 height = 480

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()