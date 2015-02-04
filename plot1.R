
# Read in data
powerdata <- read.csv("household_power_consumption.txt",sep = ";",colClasses = "character")

# Clear out unneeded data
powerdata <- subset(powerdata, as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-02")

# Open new png file as graphics device
png("plot1.png")

# Create histogram with red bars and include labels
hist(as.numeric(powerdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()

