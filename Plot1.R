
Plot1 <- function()
{
  # Load the data
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , dec = ".", stringsAsFactors = FALSE)
  filterdata <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
  
  filterdata$Global_active_power <- as.numeric(filterdata$Global_active_power)
  
  #Plot the Histogram
  png("plot1.png", width = 480 , height = 480)
  
  hist(filterdata$Global_active_power, main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", col = "Red")
  
  dev.off()
}

