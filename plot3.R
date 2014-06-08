## assuming the data file resides in the script path
epc <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character", na.strings = "?")

## subset to required date-rane
epc$DateTime <- strptime( paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset( epc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)

## 
png(file = "plot3.png", width = 480, height = 480)
with(epc,
     plot(DateTime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
)
with(epc,
     lines(DateTime, Sub_metering_1)
)
with(epc,
      lines(DateTime, Sub_metering_2, col = "red")
)
with(epc,
     lines(DateTime, Sub_metering_3, col = "blue")
)
legend("topright", lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
