#Week 1 exploratory analysis assignment

#Subset data 
data <- as.data.frame(household_power_consumption)
data1 <- data[which(data$Date == "1/2/2007"), ]
data2 <- data[which(data$Date == "2/2/2007"), ]
data3 <- rbind(data1, data2)

#Plot 2
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
data3$Date <- as.Date(data3$Date, format="%d/%m/%Y")
data3$Time <- strptime(data3$Time, format="%H:%M:%S")
data3[1:1440,"Time"] <- format(data3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data3[1441:2880,"Time"] <- format(data3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(data3$Time,as.numeric(as.character(data3$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")