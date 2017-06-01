df<-read.table(file = "household_power_consumption.txt",header = T,sep = ";")
library(dplyr)
df1<-df %>% filter(Date %in% c("2/1/2007","2/2/2007"))
hist(as.numeric(df1$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (Kilowats)")