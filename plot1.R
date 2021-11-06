library(dplyr)

# read data
df_p1 <- read.table(
  file = "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?")

# subset data
data <- filter(df_p1, Date == "1/2/2007" | Date == "2/2/2007")

# plot data
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global active power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

