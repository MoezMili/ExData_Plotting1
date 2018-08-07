## Assign data set URL to url
## Create data directory if does not exist
## Download the file and unzip the file collapsing directory structure 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd ("D:/datacourse/gcdsub/ExData_Plotting1")
if(!file.exists("./data")){dir.create("./data")}
download.file(url,destfile="./data/Dataset.zip",method="curl",mode="wb")
unzip("./data/Dataset.zip", exdir ="./data",junkpaths = TRUE )
## Get Data : convert Date and keep only the data for the needed dates
## Convert Sub_metering_1, 2 and 3
hpcons <- read.csv2(file="./data/household_power_consumption.txt")
hpcons$Date<-as.Date(hpcons$Date,format="%d/%m/%Y")
hpcons <- subset(hpcons, hpcons$Date == "2007-02-01" | hpcons$Date == "2007-02-02")
hpcons$Sub_metering_1 <- as.numeric(as.character(hpcons$Sub_metering_1))
hpcons$Sub_metering_2 <- as.numeric(as.character(hpcons$Sub_metering_2))
hpcons$Sub_metering_3 <- as.numeric(as.character(hpcons$Sub_metering_3))
png(file="plot3.png",height = 480, width=480)
plot(hpcons$Sub_metering_1,type="l",ylab="Energy sub metering",axes=FALSE,xlab="", col="black")
lines(hpcons$Sub_metering_2,col="red")
lines(hpcons$Sub_metering_3,col="blue")
axis(1, at=c(0,length(hpcons$Sub_metering_1)/2,length(hpcons$Sub_metering_1)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
dev.off()