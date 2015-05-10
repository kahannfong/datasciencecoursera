setwd("D:/Ann Coursera/Exploratory Data")
data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",dec=".",quote="",na.strings="?")
Dates1<-na.omit(data)
Dates1[,1]<-as.Date(Dates1[,1],"%d/%m/%Y")
Dates2<-c(which(Dates1[,1]=="2007-02-01"),which(Dates1[,1]=="2007-02-02"))

data2<-data[Dates2,]

d<- paste(data2[,1],data2[,2])

D3<-strptime(d,format="%d/ %m/ %Y %H:%M:%S")
Dates3<-as.POSIXct(D3)

test<-cbind(data2,Dates3)

png(filename="plot2.png",width=480,height=480)
plot(test[,10],as.numeric(as.character(test[,3])),xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
