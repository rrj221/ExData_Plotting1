library(lubridate)

download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", "data/data.zip")
unzip("data/data.zip", exdir = "data")

#read only 2/1/2007 - 2/2/2007 data
power <- read.table("data/household_power_consumption.txt", 
                    sep = ";", 
                    skip = 66637, 
                    nrows = 2880)
names(power) <- unlist(names(read.table("data/household_power_consumption.txt",
                                        nrows = 1, sep = ";", header = TRUE)))

power$Date <- dmy(power$Date)

#combine date and time
dateTime <- ymd_hms(paste(power$Date, power$Time))
power2 <- cbind(power, dateTime)

png(file = "plots/plot3.png")

with(power2, plot(Sub_metering_1 ~ dateTime, 
                  type = "l",
                  xlab = "",
                  ylab = "Energy sub metering",
                  cex.lab = .9))
with(power2, points(Sub_metering_2 ~ dateTime, type = "l", col = "red"))
with(power2, points(Sub_metering_3 ~ dateTime, type = "l", col = "blue"))

legend(
    "topright", 
    lty = c(1, 1, 1), 
    col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    cex = .8
)

dev.off()
