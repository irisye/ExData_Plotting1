household_power_consumption <- read.csv("F:/R/project1/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
household_power_consumption$Date<- as.Date(household_power_consumption$Date, "%d/%m/%Y")
subset <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subset$Date), subset$Time)
subset$datetime <- as.POSIXct(datetime)
plot(subset$Sub_metering_1~subset$datetime, col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(subset$datetime, subset$Sub_metering_2, col="red")
lines(subset$datetime, subset$Sub_metering_3, col="blue")


legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()