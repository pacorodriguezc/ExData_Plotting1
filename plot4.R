# Script to construct plot 4

# Read file and subset to 2-day period
table <- read.table("./household_power_consumption.txt", sep=";", 
                    header=TRUE, na.strings = "?")
ss <- subset(table, table$Date %in% c("1/2/2007", "2/2/2007"))
ss$Time <- strptime(paste(ss$Date,ss$Time), format = "%d/%m/%Y %T")
ss$Date <- as.Date(ss$Date, format = "%d/%m/%Y")

# Plot 4
# *** DAYS NAMES WILL BE DISPLAYED IN SPANISH, BECAUSE MY OPERATING SYSTEM IS SPANISH ***

# Initialize file name and 2 x 2 plots
png("plot4.png")
par(mfrow = c(2,2)) # initialize

# topleft plot
par(pch=" ")
plot(ss$Time, ss$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "")
lines(ss$Time, ss$Global_active_power)

# topright plot
par(pch=" ")
plot(ss$Time, ss$Voltage, 
     ylab = "Voltage",
     xlab = "datetime")
lines(ss$Time, ss$Voltage)

# bottomleft plot
par(pch=" ")
plot(ss$Time, ss$Sub_metering_1, 
     xlab="", 
     ylab = "Energy sub metering")
lines(ss$Time, ss$Sub_metering_1)
lines(ss$Time, ss$Sub_metering_2, col = "Red")
lines(ss$Time, ss$Sub_metering_3, col = "Blue")
legend("topright", legend = c(names(ss[7:9])), 
       lty = c(1,1,1), 
       col = c("Black", "Red", "Blue"),
       bty = "n")

# bottomright plot
par(pch=" ")
plot(ss$Time, ss$Global_reactive_power, 
     xlab = "datetime",
     ylab = names(ss[4]))
lines(ss$Time, ss$Global_reactive_power)
dev.off()