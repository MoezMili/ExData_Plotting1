## Assign data set URL to url
## Create data directory if does not exist
## Download the file and unzip the file collapsing directory structure 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd ("D:/datacourse/gcdsub/ExData_Plotting1")
if(!file.exists("./data")){dir.create("./data")}
download.file(url,destfile="./data/Dataset.zip",method="curl",mode="wb")
unzip("./data/Dataset.zip", exdir ="./data",junkpaths = TRUE )
## Get Data : convert Date and keep only the data for the needed dates
## Convert Other needed data
hpcons <- read.csv2(file="./data/household_power_consumption.txt")
hpcons$Date<-as.Date(hpcons$Date,format="%d/%m/%Y")
hpcons <- subset(hpcons, hpcons$Date == "2007-02-01" | hpcons$Date == "2007-02-02")
hpcons$Global_active_power <- as.numeric(as.character(hpcons$Global_active_power))
hpcons$Sub_metering_1 <- as.numeric(as.character(hpcons$Sub_metering_1))
hpcons$Sub_metering_2 <- as.numeric(as.character(hpcons$Sub_metering_2))
hpcons$Sub_metering_3 <- as.numeric(as.character(hpcons$Sub_metering_3))
hpcons$Voltage <- as.numeric(as.character(hpcons$Voltage))
hpcons$Global_reactive_power <- as.numeric(as.character(hpcons$Global_reactive_power))
png(file="plot4.png",height = 480, width=480)
par(mfrow=c(2,2))
plot(hpcons$Global_active_power,type="l",ylab="Global Active Power",axes=FALSE,xlab="")
axis(1, at=c(0,length(hpcons$Global_active_power)/2,length(hpcons$Global_active_power)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
plot(hpcons$Voltage,type="l",ylab="Voltage",axes=FALSE,xlab="datetime")
axis(1, at=c(0,length(hpcons$Voltage)/2,length(hpcons$Voltage)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
plot(hpcons$Sub_metering_1,type="l",ylab="Energy sub metering",axes=FALSE,xlab="", col="black")
lines(hpcons$Sub_metering_2,col="red")
lines(hpcons$Sub_metering_3,col="blue")
axis(1, at=c(0,length(hpcons$Sub_metering_1)/2,length(hpcons$Sub_metering_1)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1,cex=0.8,bty="n")
plot(hpcons$Global_reactive_power,type="l",ylab="Global_reactive_power",axes=FALSE,xlab="datetime")
axis(1, at=c(0,length(hpcons$Global_reactive_power)/2,length(hpcons$Global_reactive_power)), lab=c("Thu","Fri","Sat"))
axis(2,cex.axis=0.8)
box()
dev.off()