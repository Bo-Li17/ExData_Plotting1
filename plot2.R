#Before running this code, set the working directory to where the data folderlocates.
#Here I name the data folder "Electric power consumption".
#We are using dplyr package

library(dplyr)

#Read the data file.
total_data <- read.table("./Electric power consumption/household_power_consumption.txt",
                         header = TRUE,  sep=";", stringsAsFactors = FALSE, dec= ".")

#Extract the data we need, i.e. the time and global active power at the two days 1/2/2007 and 2/2/2007.
data <- filter(total_data, Date == "1/2/2007" | Date =="2/2/2007")
Global_active_power <- as.numeric(data$Global_active_power)
time <-  strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Open the png device.
png("plot2.png", width=480, height=480)

#plot the data.
plot(time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close the device.
dev.off()
