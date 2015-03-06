# Script to construct plot 1
# Course Project 1

# Read file and subset to 2-day period
table <- read.table("./household_power_consumption.txt", sep=";", 
                    header=TRUE, na.strings = "?")
ss <- subset(table, table$Date %in% c("1/2/2007", "2/2/2007"))
ss$Time <- strptime(paste(ss$Date,ss$Time), format = "%d/%m/%Y %T")
ss$Date <- as.Date(ss$Date, format = "%d/%m/%Y")

# Plot 1
png("plot1.png")
hist(ss$Global_active_power, 
     col = "Red", 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
