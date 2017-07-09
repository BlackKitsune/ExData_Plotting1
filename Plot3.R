## C4W1 - Plot3.R

# Set working directory
setwd("/Users/isabelfg/Documents/Data_Science/C4W1-Assignment")

# Load data to a file (it has header and ; as sep)
my_data <- read.table("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?")

# Subset the dat according to the dates we need
my_data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))

# Convert date time format
my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Datetime <- as.POSIXct(datetime)

with(my_data, {plot(Sub_metering_1 ~ Datetime, 
                 type="l",
                 ylab="Global Active Power (kW)")
                 lines(Sub_metering_2 ~ Datetime,col='Red')
                 lines(Sub_metering_3 ~ Datetime,col='Blue')})


legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
