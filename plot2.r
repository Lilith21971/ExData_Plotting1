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

# Generating plot 2 (line) as a png file
png("plot2.png", width=480, height=480)
plot(datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
