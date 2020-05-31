###########    04.01 Exploratory Graphs Peer Graded Assignment   #########

##################    PLOT NR. 3   ####################


## Step 1: Download and unzip file:

if(!file.exists("./data")){dir.create("./data")}
myUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myUrl, destfile="./data/exdata_data_household_power_consumption.zip")
unzip(zipfile = "./data/exdata_data_household_power_consumption.zip", exdir = "./data")


## Step 2: Read and pre-process data:

reading <- read.delim("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

reading$Date <- strptime(reading$Date, "%d/%m/%Y")

mySubset <- reading[which(reading$Date == "2007-02-01" | reading$Date == "2007-02-02"),]

mySubset$Global_active_power <- as.numeric(mySubset$Global_active_power)

mySubset$Time <- as.POSIXct(paste(mySubset$Date, mySubset$Time), format="%Y-%m-%d %H:%M:%S")


## Step 3: Create plot:

plot(mySubset$Time, mySubset$Sub_metering_1, type="n", main="", xlab = "", ylab = "Energy sub metering")

lines(mySubset$Time, mySubset$Sub_metering_1, type="l", col = "black")
lines(mySubset$Time, mySubset$Sub_metering_2, type="l", col = "red")
lines(mySubset$Time, mySubset$Sub_metering_3, type="l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = c(150,150,150), col = c("black", "red", "blue"))


## Step 4: Create PNG file:

dev.copy(png, file = "./data/plot3.png", width = 480, height = 480, units = "px")
dev.off()
