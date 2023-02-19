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

# Generating plot 3 (lines with legend) as a png file
png("plot3.png", width=480, height=480)
plot(datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subdata$Sub_metering_2, type="l", col="red")
lines(datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
