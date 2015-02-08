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
names(data1) <- names(data) # sets the name of the columns of data1
# variable to be equal to that of data variable, which is what was
# originally given in the file

# Open a new PNG file named plot1.png and plot a histogram of the
# Global_active_power column in data1 variable
png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data1$Global_active_power), breaks = 16, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
