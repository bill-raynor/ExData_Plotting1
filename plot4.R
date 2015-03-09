# Quiz 1.R - Plot 4
# Read raw data
# set colClasses to coerce intial types
colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
household <-read.table("household_power_consumption.txt",sep=';',
                       header = TRUE,
                       colClasses = colClasses,
                       na.strings ='?',
                       stringsAsFactors = FALSE)

# select dates of interest  (note that these are stored as character strings)
twodays <- household[(household$Date == "1/2/2007") |  (household$Date =="2/2/2007"),]

# convert date and time strings to a single datetime variable
datetime<- strptime(paste(twodays[,1], twodays[,2]), "%d/%m/%Y %H:%M:%S" )

old.par <-par()

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), cex=.9)
# upper left
plot(datetime,twodays$Global_active_power, 
     type="l",
     ylab="Global Active Power",
     xlab="",
     lty=1)

# upper right
plot(datetime,twodays$Voltage, 
     type="l",
     ylab="Voltage",
     lty=1)

# lower left
plot(c(datetime,datetime,datetime),c(twodays$Sub_metering_1,twodays$Sub_metering_2,twodays$Sub_metering_3), 
     type="n",
     ylab="Energy sub metering",
     xlab="")
lines(datetime,twodays$Sub_metering_1, 
     type="l",
     lty=1)
lines(datetime,twodays$Sub_metering_2, 
     type="l",
     col="red",
     lty=1)
lines(datetime,twodays$Sub_metering_3, 
      type="l",
      col="blue",
      lty=1)
legend("topright", lty=1, col=c("black","red","blue"), bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# lower right
plot(datetime,twodays$Global_reactive_power, 
     type="l",
     ylab="Voltage",
     lty=1)
dev.off()


