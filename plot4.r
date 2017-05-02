## Exploratory Data Analysis Project 1
## Plot 4
## The old stuff:
power<-read.table(file="./household_power_consumption.txt",
                  header = TRUE, sep = ";", na.strings="?")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
power<-power[power$Date %in% start:end, ]
power$datetime<-paste(power$Date,power$Time)
power$datetime<-as.POSIXlt(power$datetime,format="%Y-%m-%d %H:%M:%S")

## Set graphics parameter to accept 4 plots, copy-paste 2 and 3.
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(power$datetime,power$Global_active_power, type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
with(power, plot(datetime, Sub_metering_1, type="l", col="black",
                 xlab="", ylab="Energy sub metering"))
with(power, lines(datetime,Sub_metering_2, col="orange"))
with(power, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col=c("black","orange","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## New plots:
with(power, plot(datetime, Voltage, type="l"))
with(power, plot(datetime, Global_reactive_power, type="l"))
dev.off()