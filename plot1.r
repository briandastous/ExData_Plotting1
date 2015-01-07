df = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert date field
df[,"Date"] = as.Date(df[,"Date"], "%e/%m/%Y")

# subset by date range
df = df[df[,"Date"] >= as.Date("2007-02-01") & df[,"Date"] <= as.Date("2007-02-02"),]

df[,"Time"] = as.POSIXct(strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S"))

par(cex = 0.8)
par(mfrow=c(1,1))

# first chart
png("plot1.png")
hist(df[,"Global_active_power"], main = "Global Active Power", col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()
