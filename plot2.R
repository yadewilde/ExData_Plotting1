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
  
plot(data1$DateTime, data1$Global_active_power/500, main=NULL, 
     xlab = "", ylab="Global Active Power (kilowatts)", type="s")

# Save the plot in png
dev.copy(png, file = "./plot2.png") 
dev.off() 


