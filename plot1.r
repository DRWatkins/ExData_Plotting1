## Exploratory Data Analysis Project 1
## Plot 1
## Read and subset data
power<-read.table(file="./household_power_consumption.txt",
                  header = TRUE, sep = ";", na.strings="?")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
power<-power[power$Date %in% start:end, ]

## Plot histogram
png("plot1.png",width=480,height=480)
hist(power$Global_active_power,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red")
dev.off()
