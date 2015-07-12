library(dplyr)

consumptionAll <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("?"), header = TRUE)

consumptionAll$Date <- as.Date(consumptionAll$Date, "%d/%m/%Y")

consumptionFilter <- filter(consumptionAll, Date == "2007-02-01" | Date == "2007-02-02")

dateTime <- paste(consumptionFilter$Date, consumptionFilter$Time)
consumptionFilter$DateTime <- as.POSIXct(dateTime)

plot(consumptionFilter$Global_active_power~consumptionFilter$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
