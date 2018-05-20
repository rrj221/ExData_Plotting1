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

png(file = "plots/plot2.png")

with(power2, plot(Global_active_power ~ dateTime, 
                  type = "l",
                  xlab = "",
                  ylab = "Global Active Power (kilowatts)"))

dev.off()