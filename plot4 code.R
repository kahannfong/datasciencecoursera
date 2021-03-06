setwd("D:/Ann Coursera/Exploratory Data")
library(ggplot2)
data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",dec=".",quote="",na.strings="?")
Dates1<-na.omit(data)
Dates1[,1]<-as.Date(Dates1[,1],"%d/%m/%Y")
Dates2<-c(which(Dates1[,1]=="2007-02-01"),which(Dates1[,1]=="2007-02-02"))
#Dates2<-which(dates==2007-02-01 || dates==2007-02-02)
data2<-data[Dates2,]
#data2a<-na.omit(data2)
#data2a["Global_active_power"]<-as.numeric(data2["Global_active_power"])
#data3<-data2[-which(data2["Global_active_power"]=="?")]
d<- paste(data2[,1],data2[,2])
strptime(d)
#D3<-as.POSIXct(d,tz="GMT")

D3<-strptime(d,format="%d/ %m/ %Y %H:%M:%S")
Dates3<-as.POSIXct(D3)
test<-cbind(data2,Dates3)
#png(filename="plot2.png",width=480,height=480)
#plot(test[,10],as.numeric(as.character(test[,3])),xlab="",ylab="Global Active Power (kilowatts)")
#dev.off()
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(test[,10],as.numeric(as.character(test[,3])),xlab="",ylab="Global Active Power (kilowatts)",type="l")

plot(test[,10],as.numeric(as.character(test[,5])),xlab="datetime",ylab="Voltage",type="l")

plot(test[,10],as.numeric(as.character(test[,7])),xlab="",ylab="Energy sub metering",type="l",col="black")
lines(test[,10],as.numeric(as.character(test[,8])),type="l",col="red")
lines(test[,10],as.numeric(as.character(test[,9])),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

plot(test[,10],as.numeric(as.character(test[,4])),xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()
