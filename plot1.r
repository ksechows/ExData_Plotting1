library(dplyr)

consumptionAll <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("?"), header = TRUE)

consumptionAll$Date <- as.Date(consumptionAll$Date, "%d/%m/%Y")

consumptionFilter <- filter(consumptionAll, Date == "2007-02-01" | Date == "2007-02-02")


hist(consumptionFilter$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8))

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
