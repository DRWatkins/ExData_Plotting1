## Exploratory Data Analysis Project 1
## Plot 2
## Start with reading and subsetting from plot 1
power<-read.table(file="./household_power_consumption.txt",
                  header = TRUE, sep = ";", na.strings="?")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
power<-power[power$Date %in% start:end, ]

## Add datetime variable
power$datetime<-paste(power$Date,power$Time)
power$datetime<-as.POSIXlt(power$datetime,format="%Y-%m-%d %H:%M:%S")

## Plot line graph
png("plot2.png",width=480,height=480)
plot(power$datetime,power$Global_active_power, type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

