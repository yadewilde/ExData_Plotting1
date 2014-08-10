# Read the data
elec <- read.table("./household_power_consumption.txt", sep=";", header=T)
data <- elec 

# Paste and Convert Date and Time
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")


# Subset the data

data1 <- data[data$Date =="2007-02-01"| data$Date == "2007-02-02",]

# Make the plot

data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)  
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)



plot(data1$DateTime, data1$Sub_metering_1 , main=NULL, ylim=c(0,40), 
     xlab = "", ylab="Energy sub metering", type="s", yaxt = "n")


lines(data1$DateTime, data1$Sub_metering_2/10 , main=NULL, 
      xlab = "", type="s", col="red")


lines(data1$DateTime, data1$Sub_metering_3 , main=NULL, 
     xlab = "", type="s", col="blue")

legend("topright", lty=c(1,1,1), cex=0.75, lwd=c(2.5,2.5, 2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


axis(2, c(0, 10, 20, 30))

# Save the plot in png
dev.copy(png, file = "./plot2.png") 
dev.off() 

