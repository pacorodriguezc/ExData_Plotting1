# Script to construct plot 2

# Read file and subset to 2-day period
table <- read.table("./household_power_consumption.txt", sep=";", 
                    header=TRUE, na.strings = "?")
ss <- subset(table, table$Date %in% c("1/2/2007", "2/2/2007"))
ss$Time <- strptime(paste(ss$Date,ss$Time), format = "%d/%m/%Y %T")
ss$Date <- as.Date(ss$Date, format = "%d/%m/%Y")

# Plot 2
# *** DAYS NAMES WILL BE DISPLAYED IN SPANISH, BECAUSE MY OPERATING SYSTEM IS SPANISH ***
png("plot2.png")
par(pch=" ")
plot(ss$Time, ss$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
lines(ss$Time, ss$Global_active_power)
dev.off()
