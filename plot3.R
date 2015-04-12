getData<-function(){
 d<-read.csv(".\\household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
 d<-rbind(d[d$Date=='1/2/2007', ], d[d$Date=='2/2/2007', ])
 d$dateTime<-as.POSIXct(paste(d$Date," ",d$Time), format="%d/%m/%Y %H:%M:%S")
 d$dayAbbr<-weekdays(d$dateTime, abbreviate=TRUE)
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
plot3<-function(){
      png(filename=".\\plot3.png")
      plot(data$dateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="")
      lines(data$dateTime, data$Sub_metering_2, col="red")
      lines(data$dateTime, data$Sub_metering_3, col="blue")
      legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red','blue'), bty='n', cex=.75)
      dev.off()
}  