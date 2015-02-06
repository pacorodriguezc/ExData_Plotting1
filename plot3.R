# Script to construct plot 3

# Read file and subset to 2-day period
table <- read.table("./household_power_consumption.txt", sep=";", 
                    header=TRUE, na.strings = "?")
ss <- subset(table, table$Date %in% c("1/2/2007", "2/2/2007"))
ss$Time <- strptime(paste(ss$Date,ss$Time), format = "%d/%m/%Y %T")
ss$Date <- as.Date(ss$Date, format = "%d/%m/%Y")

# Plot 3
# *** DAYS NAMES WILL BE DISPLAYED IN SPANISH, BECAUSE MY OPERATING SYSTEM IS SPANISH ***
png("plot3.png")
par(pch=" ")
plot(ss$Time, ss$Sub_metering_1, 
     xlab="", 
     ylab = "Energy sub metering")
lines(ss$Time, ss$Sub_metering_1)
lines(ss$Time, ss$Sub_metering_2, col = "Red")
lines(ss$Time, ss$Sub_metering_3, col = "Blue")
legend("topright", legend = c(names(ss[7:9])), 
       lty = c(1,1,1), 
       col = c("Black", "Red", "Blue"))
dev.off()
