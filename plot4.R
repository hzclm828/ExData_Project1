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
        par(mfrow=c(2,2), mar=c(2.5,4,1,1), oma=c(0,0,1,0))
        with(data, {
          plot(Global_active_power~Datetime, type="l", 
               ylab="Global Active Power", xlab="")
          plot(Voltage~Datetime, type="l", 
               ylab="Voltage (volt)", xlab="datetime")
          plot(Sub_metering_1~Datetime, type="l", 
               ylab="Global Active Power", xlab="datetime")
          lines(Sub_metering_2~Datetime,col='Red')
          lines(Sub_metering_3~Datetime,col='Blue')
          legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
                 legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 seg.len=0.5)
          plot(Global_reactive_power~Datetime, type="l", 
               ylab="Global Rective Power",xlab="")
        })
## Saving the plot       
        dev.copy(png, file="plot4.png", height=480, width=480)
        dev.off()