#Week 1 exploratory analysis assignment

#Subset the data to 20070201 and 20070202
data <- as.data.frame(household_power_consumption)
data1 <- data[which(data$Date == "1/2/2007"), ]
data2 <- data[which(data$Date == "2/2/2007"), ]
data3 <- rbind(data1, data2)

# plot 1

hist(as.numeric(as.character(data3$Global_active_power)), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
