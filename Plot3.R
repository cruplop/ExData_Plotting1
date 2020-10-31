download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','Datas\\data.zip')
unzip('Datas\\data.zip',exdir='Datas')

Data <- read.csv("Datas\\household_power_consumption.txt",sep=";")

Data$Date <- as.Date(Data$Date,"%d/%m/%Y")

Data$Time <- format(strptime(Data$Time,"%H:%M:%S"),"%H:%M:%S")

Day1 <- as.Date("2007-02-01")
Day2 <- as.Date("2007-02-02")

Days <- Data$Date==Day1|Data$Date==Day2

Data <- Data[Days,]

plot(Data$Date + c((1:1440)/1440,(1:1440)/1440),as.numeric(Data$Sub_metering_1), xlab = "", main = "", ylab = "Energy sub metering", type = "l")
lines(Data$Date + c((1:1440)/1440,(1:1440)/1440),as.numeric(Data$Sub_metering_2),col = "red")
lines(Data$Date + c((1:1440)/1440,(1:1440)/1440),as.numeric(Data$Sub_metering_3), col = "blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1,cex = 1,text.width = 0.55)

dev.print(png, 'Plot3.png',width = 480, height = 480)

