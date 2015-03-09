# Quiz 1.R  - Plot 2
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

png("plot2.png", width=480, height=480)
plot(datetime,twodays$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     lty=1)
dev.off()


