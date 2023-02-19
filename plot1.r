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

# Generating plot 1 (histogram) as a png file

png("plot1.png", width=480, height=480)
hist(subdata[, 3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
