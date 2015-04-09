## Getting full dataset
dat_house_power <- read.csv("./household_power_consumption.txt", header=T, sep=';',stringsAsFactors=F,dec=".")
dat_house_power$Date <- as.Date(dat_house_power$Date, format="%d/%m/%Y")

## Get the data we need to plot
dat_subset <- subset(dat_house_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## format date/time in date/time string
datetime <- paste(as.Date(dat_subset$Date), dat_subset$Time)
dat_subset$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(dat_subset$Global_active_power~dat_subset$Datetime, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## Saving to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
