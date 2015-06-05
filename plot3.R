#plot2.png
# Greg R Gay

library(datasets)

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
plot(as.numeric(c2007$Sub_metering_3),
     type = "l",
     ylab="Energy Sub Metering",
     xlab="",
     xaxt = 'n',
     ylim = c(0,40),
     col="blue"
)
lines(c2007$Sub_metering_2, lty=1, type="l", col="red" )
lines(c2007$Sub_metering_1, lty=1, type="l", col="black" )
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1), col=c("black","red","blue"))
axis(1,at=c(0,1500,2900),labels=c("thur","fri","sat"))
#dev.copy(png, file = "plot3.png")  ## Copy the plot to a PNG file
#dev.off()