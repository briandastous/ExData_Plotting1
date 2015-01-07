df = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert date field
df[,"Date"] = as.Date(df[,"Date"], "%e/%m/%Y")

# subset by date range
df = df[df[,"Date"] >= as.Date("2007-02-01") & df[,"Date"] <= as.Date("2007-02-02"),]

df[,"Time"] = as.POSIXct(strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S"))

par(cex = 0.8)
par(mfrow=c(1,1))

# third chart
png("plot3.png")
plot(df[,"Time"], df[,"Sub_metering_1"], type="l", ylab = "Energy sub metering", xlab = "")
lines(df[,"Time"], df[,"Sub_metering_2"], col="red")
lines(df[,"Time"], df[,"Sub_metering_3"], col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()