# plot4.png
# Greg R Gay

library(datasets)
par(mfrow = c(2,2))
# read in the full data set if it has not already 
if(!exists("consumption")){
    consumption <- read.table("household_power_consumption.txt", 
                              sep=";", 
                              na.strings = "?",
                              header=TRUE)
}

# use strptime() and as.Date()
# set the date range we need
date1 <- as.Date("01/02/2007", format="%d/%m/%Y")
date2 <- as.Date("02/02/2007", format="%d/%m/%Y")

# create the subset we need Feb 1 & 2, 2007
if(!exists("c2007")){ 
    c2007 <- subset(
        consumption, 
        as.Date(consumption$Date, 
                format="%d/%m/%Y") >= date1 & as.Date(consumption$Date, format="%d/%m/%Y") <= date2
    ) 
}
# data to file tosee what it looks like
#write.table(c2007, "c2007.csv", sep=",")

# The first graph 
source("./plot2.R")

# The second graph
plot(as.numeric(c2007$Voltage),
     type = "l",
     ylab="Voltage",
     xlab="datetime",
     xaxt = 'n',
     col="blue"
)
lines(c2007$Voltage, lty=1, type="l", col="black" )
axis(1,at=c(0,1500,2900),labels=c("thur","fri","sat"))

# The third graph
source("./plot3.R")

# The fourth graph
plot(as.numeric(c2007$Global_reactive_power),
     type = "l",
     ylab="Global_reactive_power",
     xlab="datetime",
     xaxt = 'n',
     col="blue"
)
lines(c2007$Global_reactive_power, lty=1, type="l", col="black" )
axis(1,at=c(0,1500,2900),labels=c("thur","fri","sat"))

dev.copy(png, file = "plot4.png")  ## Copy the plot to a PNG file
dev.off()