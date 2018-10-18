##  Exploratory Data Analysis - Course Project 1
##  plot1.R
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


## Now plot histogram for Global Active power
hist(hpc_dt$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power")


# Now save the plot to a PNG width = 480 height = 480

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()