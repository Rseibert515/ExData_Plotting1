df<-read.table(file = "household_power_consumption.txt",header = T,sep = ";")
dff<-df %>% mutate(DateTime=dmy_hms(paste(Date,Time)))
library(dplyr)
library(lubridate)
dff$Date<- dmy(dff$Date)

df1<-dff %>% filter(Date %in% c(mdy("2/1/2007"),mdy("2/2/2007")))

png("Plot4.png",width = 480,height=480,units = "px")

par(mfcol=c(2,2))

plot(df1$DateTime,df1$Global_active_power,type = "l",xlab="",ylab="Global Active Power (Kilowats)")

with(df1,plot(DateTime,Sub_metering_1,type="l",ylab="Energy Sub metering",xlab=""))
lines(df1$DateTime,df1$Sub_metering_2,type = "l",col="red")
lines(df1$DateTime,df1$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),col = c("black","red","blue"),lty=c(1,1,1),bty="n",cex=.3)

plot(df1$DateTime,df1$Voltage,xlab="DateTime",ylab="Voltage",type="l")
plot(df1$DateTime,df1$Global_reactive_power,xlab="DateTime",ylab="Global Reactive Power",type="l")
dev.off()
