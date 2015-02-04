#read in Data, specify columns as classes to allow conversion to numeric
powerdata <- read.csv("household_power_consumption.txt",sep = ";",colClasses = "character")

#strip out all but 02-01-2007 and 02-02-2007
powerdata <- subset(powerdata, as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-02")

#create png file and set as device
png("plot2.png")

#Plots points with Day and Time as X-axis and GLobal Active Power as Y-axis connects points with line
plot(strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(powerdata$Global_active_power),ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()