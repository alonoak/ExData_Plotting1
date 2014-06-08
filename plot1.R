## assuming the data file resides in the script path
epc <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character", na.strings = "?")

## subset to required date-rane
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset( epc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
epc$Global_active_power <- as.numeric(epc$Global_active_power)
## 
png(file = "plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

