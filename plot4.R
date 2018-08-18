#Before running this code, set the working directory to where the data folderlocates.
#Here I name the data folder "Electric power consumption".
#We are using dplyr package.

library(dplyr)

#Read the data file.
total_data <- read.table("./Electric power consumption/household_power_consumption.txt",
                         header = TRUE,  sep=";", stringsAsFactors = FALSE, dec= ".")

#Extract the data we need.
data <- filter(total_data, Date == "1/2/2007" | Date =="2/2/2007")
time <-  strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
Voltage <- as.numeric(data$Voltage)
Global_active_power <- as.numeric(data$Global_active_power)
Global_reactive_power <- as.numeric(data$Global_reactive_power)


#Open the png device and set the par.
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#Plot the 1st image.
plot(time, Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plot the 2dn image.
plot(time, Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot the 3rd image.
plot(time, Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(time, Sub_metering_2, col = "red" )
lines(time, Sub_metering_3, col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,  col=c("black", "red", "blue"),bty="n",cex=0.75)

#Plot the 4th image.
plot(time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the device.
dev.off()