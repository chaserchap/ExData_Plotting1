#read in Data, specify columns as classes to allow conversion to numeric
powerdata <- read.csv("household_power_consumption.txt",sep = ";",colClasses = "character")

#strip out all but 02-01-2007 and 02-02-2007
powerdata <- subset(powerdata, as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-02")

#create png file and set as graphics device
png("plot4.png")

#set up view for four plots
par(mfrow = c(2,2))

#[1,1] plot
plot(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Global_active_power),ylab = "Global Active Power", xlab = "", type = "l")

#[1,2] plot
plot(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Voltage),ylab = "Voltage", xlab = "datetime", type = "l")

#[2,1] plot
#Plots line with Day and Time as X-axis and Sub_metering_1 as Y-axis
plot(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Sub_metering_1),ylab = "Energy sub metering", xlab = "", type = "l")

#Plots red line with Day and Time as X-axis and Sub_metering_2 as Y-axis
lines(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Sub_metering_2), col = "red")

#Plots blue line with Day and Time as X-axis and Sub_metering_3 as Y-axis
lines(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Sub_metering_3), col = "blue")

#Adds legend with line as character and appropriate colors for each category
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, bty = "n", cex=.9)

#[2,2] plot
plot(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Global_reactive_power),ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()
