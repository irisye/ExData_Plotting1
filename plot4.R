household_power_consumption <- read.csv("F:/R/project1/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
household_power_consumption$Date<- as.Date(household_power_consumption$Date, "%d/%m/%Y")
subset <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subset$Date), subset$Time)
subset$datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))

plot(subset$datetime, subset$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")


plot(subset$datetime, subset$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")


plot(subset$Sub_metering_1~subset$datetime, col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(subset$datetime, subset$Sub_metering_2, col="red")
lines(subset$datetime, subset$Sub_metering_3, col="blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

plot(subset$datetime, subset$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()