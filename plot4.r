library(dplyr)

consumptionAll <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("?"), header = TRUE)

consumptionAll$Date <- as.Date(consumptionAll$Date, "%d/%m/%Y")

consumptionFilter <- filter(consumptionAll, Date == "2007-02-01" | Date == "2007-02-02")

dateTime <- paste(consumptionFilter$Date, consumptionFilter$Time)
consumptionFilter$DateTime <- as.POSIXct(dateTime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(consumptionFilter, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
