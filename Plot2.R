Plot2 <- function()
{
  # Load the data
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , dec = ".", stringsAsFactors = FALSE)
  filterdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  
  filterdata$Global_active_power <- as.numeric(filterdata$Global_active_power)
  
  #Plot Graph
  GAP <- as.numeric(filterdata$Global_active_power)
 
  date <- strptime(paste(filterdata$Date,filterdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  png("plot2.png" , width = 480 ,height = 480)
  plot(date ,GAP ,type = "l" , ylab= "Energy sub metering", xlab = "" )
  dev.off()
  
}