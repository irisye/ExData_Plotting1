##read data into R
household_power_consumption <- read.csv("F:/R/project1/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

##convert to date data type
household_power_consumption$Date<- as.Date(household_power_consumption$Date, "%d/%m/%Y")

##subset only the data needed
subset <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##paste date and time together for future use
datetime <- paste(as.Date(subset$Date), subset$Time)

##convert to POSIXct data type
subset$datetime <- as.POSIXct(datetime)

##plot2
plot(subset$Global_active_power~subset$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##copy to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
