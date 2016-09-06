Plot4 <- function()
{
  # Load the data
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , dec = ".", stringsAsFactors = FALSE)
  filterdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  
  filterdata$Global_active_power <- as.numeric(filterdata$Global_active_power)
  
  
  date <- strptime(paste(filterdata$Date, filterdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  GAP <- as.numeric(filterdata$Global_active_power)
  GRP <- as.numeric(filterdata$Global_reactive_power)
  Volt <- as.numeric(filterdata$Voltage)
  sm1 <- as.numeric(filterdata$Sub_metering_1)
  sm2 <- as.numeric(filterdata$Sub_metering_2)
  sm3 <- as.numeric(filterdata$Sub_metering_3)
  
  #Plot Data
  png("plot4.png", width=480, height=480)
  
  par(mfrow = c(2,2))
  plot(date , GAP , type = "l" , ylab = "Global Active Power ", xlab = "")
  plot(date , Volt , type = "l" , ylab = "Voltage" , xlab = "datetime")

  plot(date, sm1, type="l", ylab="Energy Submetering", xlab="")
  lines(date, sm2, type="l", col="red")
  lines(date, sm3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  plot( date , GRP , type = "l" , ylab = "Global_reactive_power" , xlab = "datetime")
  dev.off()
  
}