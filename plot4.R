# Read the data
elec <- read.table("./household_power_consumption.txt", sep=";", header=T)
data <- elec 

# Paste and Convert Date and Time
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")


# Subset the data

data1 <- data[data$Date =="2007-02-01"| data$Date == "2007-02-02",]

# Convert the variables in numeric

data1$Sub_metering_1 <- type.convert(as.character(data1$Sub_metering_1), dec = ".")
data1$Sub_metering_2 <- type.convert(as.character(data1$Sub_metering_2), dec = ".")
data1$Sub_metering_3 <- type.convert(as.character(data1$Sub_metering_3), dec = ".")
data1$Global_reactive_power <- type.convert(as.character(data1$Global_reactive_power), dec = ".")
data1$Global_active_power <- type.convert(as.character(data1$Global_active_power), dec = ".")





# Make the plot


# Plot 1
plot(data1$DateTime, data1$Global_active_power/500, main=NULL, 
     xlab = "", ylab="Global Active Power (kilowatts)", type="s")

# Plot 2

plot(data1$DateTime, data1$Voltage, main=NULL, 
     xlab = "", ylab="Voltage", type="s")

# Plot 3
plot(data1$DateTime, data1$Sub_metering_1 , main=NULL, ylim=c(0,40), 
     xlab = "", ylab="Energy sub metering", type="s", yaxt = "n")


lines(data1$DateTime, data1$Sub_metering_2 , main=NULL, 
      xlab = "", type="s", col="red")


lines(data1$DateTime, data1$Sub_metering_3 , main=NULL, 
      xlab = "", type="s", col="blue")

legend("topright", lty=c(1,1,1), cex=0.75, lwd=c(2.5,2.5, 2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

axis(2, c(0, 10, 20, 30))

# Plot 4

plot(data1$DateTime, data1$Global_reactive_power, main=NULL, 
     xlab = "", type="s")




# Save the plot in png
dev.copy(png, file = "./plot3.png") 
dev.off() 
