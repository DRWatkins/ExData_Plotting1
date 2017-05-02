## Exploratory Data Analysis Project 1
## Plot 3
## Start with the reading, subsetting, and variables from parts 1/2
power<-read.table(file="./household_power_consumption.txt",
                  header = TRUE, sep = ";", na.strings="?")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
power<-power[power$Date %in% start:end, ]
power$datetime<-paste(power$Date,power$Time)
power$datetime<-as.POSIXlt(power$datetime,format="%Y-%m-%d %H:%M:%S")

## Plot the graph, add lines for additional variables, create legend
png("plot3.png",width=480,height=480)
with(power, plot(datetime, Sub_metering_1, type="l", col="black",
    xlab="", ylab="Energy sub metering"))
with(power, lines(datetime,Sub_metering_2, col="orange"))
with(power, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col=c("black","orange","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()