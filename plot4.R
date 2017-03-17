#Read in dataset from current working directory

energy <- read.table(file="household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors = FALSE, header=TRUE)
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")     #Convert Date variable
energy <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  #subset on days we want

#Create new DateTime variable and plot as a PNG file

energy$DateTime <- paste(energy$Date, energy$Time)
energy$DateTime <- as.POSIXlt(energy$DateTime, format="%Y-%m-%d %H:%M:%S")
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(energy$DateTime, energy$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(energy$DateTime, energy$Voltage, type="l", xlab="datetime", ylab="Voltage")?
plot(energy$DateTime, energy$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(energy$DateTime,energy$Sub_metering_1, type="l")
lines(energy$DateTime,energy$Sub_metering_2, type="l", col="red")
lines(energy$DateTime,energy$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1), 
       col=c("black", "red", "blue"), bty="n")
plot(energy$DateTime, energy$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()