##read data into R
household_power_consumption <- read.csv("F:/R/project1/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
##convert character to date type
household_power_consumption$Date<- as.Date(household_power_consumption$Date, "%d/%m/%Y")
##subset the data only necessary
subset <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##plot 1
with(subset, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
##copy to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
