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
hist(data1$Global_active_power, main="Global Active Power", col="red",  xlab = "Global Active Power (kilowatts)")

# Save the plot in png
dev.copy(png, file = "./plot1.png") 
dev.off() 


