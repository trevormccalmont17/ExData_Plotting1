# This script creates plot2.png

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

png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(dat$DateTime, dat$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
