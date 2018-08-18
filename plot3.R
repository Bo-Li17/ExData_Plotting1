#Before running this code, set the working directory to where the data folderlocates.
#Here I name the data folder "Electric power consumption".
#We are using dplyr package.

library(dplyr)

#Read the data file.
total_data <- read.table("./Electric power consumption/household_power_consumption.txt",
                         header = TRUE,  sep=";", stringsAsFactors = FALSE, dec= ".")

#Extract the data we need, i.e. the time and Sub_metering at the two days 1/2/2007 and 2/2/2007.
data <- filter(total_data, Date == "1/2/2007" | Date =="2/2/2007")
time <-  strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)


#Open the png device.
png("plot3.png", width=480, height=480)

#plot the Sub_metering one by one.
plot(time, Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(time, Sub_metering_2, col = "red" )
lines(time, Sub_metering_3, col = "blue" )

#Add legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,  col=c("black", "red", "blue"))

#Close the device.
dev.off()