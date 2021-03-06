# Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,  na.strings = "?")
days <- as.character(data[ ,1])
rows <- 1:nrow(data)
data1 <- data.frame()
count <- 0

# Loop through the data and see where the dates fall in between the
# days Feb 1, 2007-Feb 2, 2007 and save the data from those days
# under a new variable
for (i in rows) {
  if (days[i] == "1/2/2007" | days[i] == "2/2/2007") {
    count <- count + 1
    data1[count,1] <- data[i,1]
    data1[count,2] <- data[i,2]
    data1[count,3] <- as.numeric(data[i,3])
    data1[count,4] <- as.numeric(data[i,4])
    data1[count,5] <- as.numeric(data[i,5])
    data1[count,6] <- as.numeric(data[i,6])
    data1[count,7] <- as.numeric(data[i,7])
    data1[count,8] <- as.numeric(data[i,8])
    data1[count,9] <- as.numeric(data[i,9])
  }  
}
names(data1) <- names(data)

len <- 1:nrow(data1)
# days and times are character variables of Date and Time columns of
# the data1 variable
days <- as.character(data1$Date)
times <- as.character(data1$Time)
fulltimes <- as.character()

# Loop through the data1 variable and combine the Date and Time 
# character vector into one vector 
for (i in len) {
  fulltimes[i] <- paste(days[i], times[i])
}
# This takes the combined Date and Time character vector and then 
# makes another vector that saves these values as POSIXlt and 
# POSIXt values, so that we can have better plots
datetime <- strptime(fulltimes, format = "%d/%m/%Y %H:%M:%S")

# Open a new PNG file named plot2.png and plot the Global_active_power
# column versus the time for the data1 variable
png("plot2.png", width = 480, height = 480, units = "px")
plot(datetime, data1$Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)")
lines(datetime,data1$Global_active_power)
dev.off()



