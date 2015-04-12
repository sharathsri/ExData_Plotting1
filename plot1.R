getData<-function(){
 d<-read.csv(".\\household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
 d<-rbind(d[d$Date=='1/2/2007', ], d[d$Date=='2/2/2007', ])
 d$Date<-strptime(d$Date,"%d/%m/%Y")
 d$day<-d$Date$wday+1
 d$dayAbbr<-c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")[d$Date$wday+1]
 d$Time<-strptime(d$Time, "%H:%M:%S")
 d$Global_active_power<-as.numeric(d$Global_active_power)
 d$Global_reactive_power<-as.numeric(d$Global_reactive_power)
 d$Voltage<-as.numeric(d$Voltage)
 d$Global_intensity<-as.numeric(d$Global_intensity)
 d$Sub_metering_1<-as.numeric(d$Sub_metering_1)
 d$Sub_metering_2<-as.numeric(d$Sub_metering_2)
 d$Sub_metering_3<-as.numeric(d$Sub_metering_3)
 d
}
data<-getData()
plot1<-function(){
      png(filename=".\\plot1.png")
      hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
      dev.off()
}  