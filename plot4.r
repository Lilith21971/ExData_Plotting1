#setwd("C:/Users/Lilian/CursoR_Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

# Importing, reading and sub-setting data

if(!file.exists("household_power_consumption.txt")) {
  tmp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", tmp)
  unzip(tmp)
  unlink(tmp)
}

datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header = T, sep = ";", dec = ".", na.strings = "?")
head(data)
names(data)
str(data)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Creating variable combining date and time in the appropriate class to use as the x-axis
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
class(datetime)

# Generating plot 4 (panel with 4 plots) as a png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subdata$Sub_metering_2, type="l", col="red")
lines(datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n", cex=0.9)

plot(datetime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
