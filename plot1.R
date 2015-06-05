# plot1.png
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
# data to file to see what it looks like
#write.table(c2007, "c2007.csv", sep=",")

# Generate a histogram
hist(
    as.double(c2007$Global_active_power), 
    col = "red", 
    xlab="Global Active Power (kilowatts)", 
    ylab="Frequency",
    main="Global Active Power",
    )
#dev.copy(png, file = "plot1.png")  ## Copy the histogram to a PNG file
#dev.off()