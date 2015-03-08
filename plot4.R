# This script creates plot4.png

# Import the data

dat <- read.csv("household_power_consumption.txt", header=TRUE,
    sep=";", stringsAsFactors = FALSE)

# Convert the dates to the correct format and subset the data

dat[,1] = as.Date(dat[,1], format="%d/%m/%Y")
dat = subset(dat, Date > "2007-01-31" & Date < "2007-02-03")

# Combine date and time objects

dat[,10] = as.POSIXct(paste(dat$Date, dat$Time),
    format = "%Y-%m-%d %H:%M:%S")
names(dat)[10] = "DateTime"

# Initialize plotting interface and create the plot

png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

# Plot 4 top left

plot(dat$DateTime,dat$Global_active_power, main="", xlab="",
    ylab="Global Active Power", type="l")

# Plot 4 top right

plot(dat$DateTime, dat$Voltage, main="", xlab="datetime",
    ylab="Voltage", type="l")

# Plot 4 bottom left

plot(dat$DateTime, dat$Sub_metering_1, type="l", xlab="",
    ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col="red")
lines(dat$DateTime, dat$Sub_metering_3, col="blue")
legend("topright", col=c("black","blue","red"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty=1, bty="n")

# Plot 4 bottom right

plot(dat$DateTime, dat$Global_reactive_power, main="",
    xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()