df = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert date field
df[,"Date"] = as.Date(df[,"Date"], "%e/%m/%Y")

# subset by date range
df = df[df[,"Date"] >= as.Date("2007-02-01") & df[,"Date"] <= as.Date("2007-02-02"),]

df[,"Time"] = as.POSIXct(strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S"))

par(cex = 0.8)
par(mfrow=c(1,1))

# second chart
png("plot2.png")
plot(df[,"Time"], df[,"Global_active_power"], type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()