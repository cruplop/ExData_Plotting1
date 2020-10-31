download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','Datas\\data.zip')
unzip('Datas\\data.zip',exdir='Datas')

Data <- read.csv("Datas\\household_power_consumption.txt",sep=";")

Data$Date <- as.Date(Data$Date,"%d/%m/%Y")

Data$Time <- format(strptime(Data$Time,"%H:%M:%S"),"%H:%M:%S")

Day1 <- as.Date("2007-02-01")
Day2 <- as.Date("2007-02-02")

Days <- Data$Date==Day1|Data$Date==Day2

Data <- Data[Days,]

hist(as.numeric(Data$Global_active_power),col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.print(png, 'Plot1.png',width = 480, height = 480)
