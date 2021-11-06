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
plot(
  x = data$dateTime,
  y = data$Global_active_power, 
  xlab = "",
  ylab = "Global active power (kilowatts)", 
  type = "l"
  )

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
