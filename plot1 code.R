setwd("D:/Ann Coursera/Exploratory Data")
data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",dec=".",quote="",na.strings="?")
Dates1<-na.omit(data)
dates<-as.Date(Dates1[,1],"%d/%m/%Y")
Dates2<-c(which(Dates1[,1]=="1/2/2007"),which(Dates1[,1]=="2/2/2007"))
#Dates2<-which(dates==2007-02-01 || dates==2007-02-02)
data2<-data[Dates2,]
#data2a<-na.omit(data2)
#data2a["Global_active_power"]<-as.numeric(data2["Global_active_power"])
#data3<-data2[-which(data2["Global_active_power"]=="?")]
png(filename="plot1.png",width=480,height=480)
hist(as.numeric(as.character(data2[,3])),xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
dev.off()
