## C4W1 - Plot4.R

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

# Create a window with 2 rows and 2 col
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Plot the 4 
with(my_data, {
  plot(Global_active_power ~ Datetime, 
       type="l", 
       ylab="Global Active Power (kW)")
  plot(Voltage ~ Datetime, 
       type="l", 
       ylab="Voltage (volt)")
  plot(Sub_metering_1 ~ Datetime, 
       type="l", 
       ylab="Global Active Power (kW)")
  lines(Sub_metering_2 ~ Datetime,col='Red')
  lines(Sub_metering_3 ~ Datetime,col='Blue')
  legend("topright", 
         col=c("black", "red", "blue"), 
         lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, 
       type="l", 
       ylab="Global Rective Power (kW)",xlab="")})

# Save to png file
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
