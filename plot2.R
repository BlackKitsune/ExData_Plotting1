## C4W1 - Plot2.R

# Set working directory
setwd("/Users/isabelfg/Documents/Data_Science/C4W1-Assignment")

# Load data to a file (it has header and ; as sep)
my_data <- read.table("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?")

# Subset the dat according to the dates we need
my_data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))

# Transform date time to format

my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Datetime <- as.POSIXct(datetime)

# Plot the data
pdf(file = "plot2.pdf", width=480, height=480)
with(my_data, plot(Global_active_power ~ Datetime, 
                  type="l",
                  ylab="Global Active Power (kW)"))
dev.off()

dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

