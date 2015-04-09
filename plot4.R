# Getting full dataset
dat_house_power <- read.csv("./household_power_consumption.txt", header=T, sep=';',stringsAsFactors=F,dec=".")
dat_house_power$Date <- as.Date(dat_house_power$Date, format="%d/%m/%Y")

## Get the data we need to plot
dat_subset <- subset(dat_house_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## format date/time in date/time string
datetime <- paste(as.Date(dat_subset$Date), dat_subset$Time)
dat_subset$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat_subset, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=, lwd=2.5, bty="o",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Reactive Power (kilowatts)",xlab="")
})

## Saving to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
