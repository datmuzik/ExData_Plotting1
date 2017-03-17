#Read in dataset from current working directory

energy <- read.table(file="household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors = FALSE, header=TRUE)
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")     #Convert Date variable
energy <- subset(energy, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  #subset on days we want

#Create Histogram as a PNG file

par(mar=c(5,5,3,1))
png('plot1.png', width=480, height=480)
hist(energy$Global_active_power, breaks=12, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()