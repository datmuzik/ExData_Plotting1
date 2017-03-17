#Read in dataset from current working directory

energy <- read.table(file="household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors = FALSE, header=TRUE)
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")     #Convert Date variable
energy <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  #subset on days we want

#Create new DateTime variable and plot as a PNG file

par(mar=c(5,5,3,1))
energy$DateTime <- paste(energy$Date, energy$Time)
energy$DateTime <- as.POSIXlt(energy$DateTime, format="%Y-%m-%d %H:%M:%S")
png('plot3.png', width=480, height=480)
plot(energy$DateTime, energy$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(energy$DateTime,energy$Sub_metering_1, type="l")
lines(energy$DateTime,energy$Sub_metering_2, type="l", col="red")
lines(energy$DateTime,energy$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1), col=c("black", "red", "blue"))
dev.off()