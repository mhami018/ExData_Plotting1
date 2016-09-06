
Plot3 <- function()
{

# Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , dec = ".", stringsAsFactors = FALSE)
filterdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

filterdata$Global_active_power <- as.numeric(filterdata$Global_active_power)

sm1 <- as.numeric(filterdata$Sub_metering_1)
sm2 <- as.numeric(filterdata$Sub_metering_2)
sm3 <- as.numeric(filterdata$Sub_metering_3)

date <- strptime(paste(filterdata$Date,filterdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot3.png" , width = 480 ,height = 480)
plot(date ,sm1 ,type = "l" , ylab= "Energy sub metering", xlab = "" )
lines(date , sm2 , type = "l" , col ="red")
lines(date , sm3 , type = "l" , col ="blue")
legend("topright", lty = 1 ,lwd = 2.5 , col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

}