library(dplyr)

consumptionAll <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("?"), header = TRUE)

consumptionAll$Date <- as.Date(consumptionAll$Date, "%d/%m/%Y")

consumptionFilter <- filter(consumptionAll, Date == "2007-02-01" | Date == "2007-02-02")

dateTime <- paste(consumptionFilter$Date, consumptionFilter$Time)
consumptionFilter$DateTime <- as.POSIXct(dateTime)

with(consumptionFilter, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
