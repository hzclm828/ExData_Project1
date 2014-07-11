## Setting working directory       
        setwd("C:/Users/Zhetong/Desktop/Coursera/Exploratory Data Analysis")
## Getting data
        dataset <- read.csv("household_power_consumption.txt", header=T, 
                    sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
        dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
## Subsetting the data
        data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
        rm(dataset)
## Converting dates
        datetime <- paste(as.Date(data$Date), data$Time)
        data$Datetime <- as.POSIXct(datetime)
## Creating plot
        with(data, {
          plot(Sub_metering_1~Datetime, type="l",
               ylab="Global Active Power (kilowatts)", xlab="")
          lines(Sub_metering_2~Datetime,col='Red')
          lines(Sub_metering_3~Datetime,col='Blue')
        })
## Creating legend        
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving the plot       
        dev.copy(png, file="plot3.png", height=480, width=480)
        dev.off() 