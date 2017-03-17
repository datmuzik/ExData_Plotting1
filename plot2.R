#Read in dataset from current working directory

energy <- read.table(file="household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors = FALSE, header=TRUE)
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")     #Convert Date variable
energy <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  #subset on days we want

#Create new DateTime variable and plot as a PNG file

par(mar=c(5,5,3,1))
energy$DateTime <- paste(energy$Date, energy$Time)
energy$DateTime <- as.POSIXlt(energy$DateTime, format="%Y-%m-%d %H:%M:%S")
png('plot2.png', width=480, height=480)
plot(energy$DateTime, energy$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()