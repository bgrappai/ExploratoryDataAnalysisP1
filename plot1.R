## Getting full dataset
dat_house_power <- read.csv("./household_power_consumption.txt", header=T, sep=';',stringsAsFactors=F)
dat_house_power$Date <- as.Date(dat_house_power$Date, format="%d/%m/%Y")

## Get the data we need to plot
dat_subset <- subset(dat_house_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot 1
GlobalActivePower <- as.numeric(dat_subset$Global_active_power)
hist(GlobalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()