df<-read.table(file = "household_power_consumption.txt",header = T,sep = ";")
dff<-df %>% mutate(DateTime=dmy_hms(paste(Date,Time)))
library(dplyr)
library(lubridate)
dff$Date<- dmy(dff$Date)

df1<-dff %>% filter(Date %in% c(mdy("2/1/2007"),mdy("2/2/2007")))

png(filename = "Plot2.png",width = 480,height=480,units = "px")
plot(df1$DateTime,df1$Global_active_power,type = "l",xlab="",ylab="Global Active Power (Kilowats)")
dev.off()