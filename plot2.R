##  Exploratory Data Analysis - Course Project 1
##  plot2.R
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


## Now plot for Global Active power Vs DateTime
plot(hpc_dt$dt, hpc_dt$Global_active_power, type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts")


# Now save the plot to a PNG width = 480 height = 480

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()