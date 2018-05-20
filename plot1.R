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

png(file = "plots/plot1.png")

hist(power$Global_active_power, 
     main = "Global Active Power", 
     col = "red",
     xlab = "Global Active Power (kilowats)")

dev.off()


