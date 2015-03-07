# This script creates plot1.png

# Import the data

dat <- read.csv("household_power_consumption.txt", header=TRUE,
                sep=";", stringsAsFactors = FALSE)

# Convert the dates to the correct format and subset the data

dat[,1] = as.Date(dat[,1], format="%d/%m/%Y")
dat = subset(dat, Date > "2007-01-31" & Date < "2007-02-03")

# Initialize plotting interface and create the plot

png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(dat$Global_active_power), col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
