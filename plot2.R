## Assign data set URL to url
## Create data directory if does not exist
## Download the file and unzip the file collapsing directory structure 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd ("D:/datacourse/gcdsub/ExData_Plotting1")
if(!file.exists("./data")){dir.create("./data")}
download.file(url,destfile="./data/Dataset.zip",method="curl",mode="wb")
unzip("./data/Dataset.zip", exdir ="./data",junkpaths = TRUE )
## Get Data : convert Date and Global_active _power and keep only the data for the needed dates
hpcons <- read.csv2(file="./data/household_power_consumption.txt")
hpcons$Date<-as.Date(hpcons$Date,format="%d/%m/%Y")
hpcons <- subset(hpcons, hpcons$Date == "2007-02-01" | hpcons$Date == "2007-02-02")
hpcons$Global_active_power <- as.numeric(as.character(hpcons$Global_active_power))
png(file="plot2.png",height = 480, width=480)
plot(hpcons$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",axes=FALSE,xlab="")
axis(1, at=c(0,length(hpcons$Global_active_power)/2,length(hpcons$Global_active_power)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off()