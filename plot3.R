library(dplyr)

# read data
df_p1 <- read.table(
  file = "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?")

# subset data
data <- filter(df_p1, Date == "1/2/2007" | Date == "2/2/2007")

# conversion and new variable of date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- mutate(data, dateTime = as.POSIXct(paste(data$Date, data$Time)))

# plot data
with(data, {
  plot(
    x = data$dateTime,
    y = data$Sub_metering_1, 
    xlab = "",
    ylab = "Energy sub metering", 
    type = "l"
  )
  lines(data$dateTime, data$Sub_metering_2, col = "red")
  lines(data$dateTime, data$Sub_metering_3, col = "blue")
  legend("topright", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty = 1
  )
})
  
## export file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
