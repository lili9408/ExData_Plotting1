#Plot 4
#Week 1 exploratory analysis assignment

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


#plot4

par(mfrow = c(2,2))
#par(mar = rep(4, 4))

plot(data3$Time,as.numeric(as.character(data3$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")   
plot(data3$Time,as.numeric(as.character(data3$Voltage)),type="l",xlab="datetime",ylab="Voltage") 
plot(data3$Time, as.numeric(as.character(data3$Sub_metering_1)), type = "n", xlab ="", ylab = "Energy Sub Metering")
with(data3, lines(Time, as.numeric(as.character(data3$Sub_metering_1))))
with(data3, lines(Time, as.numeric(as.character(data3$Sub_metering_2)), col = "red"))
with(data3, lines(Time, as.numeric(as.character(data3$Sub_metering_3)), col = "blue"))
legend(locator(1), lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.5, pt.cex = cex, text.width = 2, x.intersp = 0.5, bty = "n")
plot(data3$Time,as.numeric(as.character(data3$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_Reactive_Power")








