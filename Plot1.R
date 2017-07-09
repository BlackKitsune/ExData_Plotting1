## C4W1 - Plot1.R

# Set working directory
setwd("/Users/isabelfg/Documents/Data_Science/C4W1-Assignment")

# Load data to a file (it has header and ; as sep)
my_data <- read.table("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?")

# Subset the dat according to the dates we need
my_data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))

# Distribution of values of the active power
active_power <- my_data$Global_active_power
hist(active_power, 
     xlab = "Global Active Power (kW)",
     ylab = "Frequency",
     col = "red",
     main = "Global Active Power")

# Save to png file
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

