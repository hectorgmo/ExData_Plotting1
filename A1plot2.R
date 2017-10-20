# Assignment One: Exploratory Data Analysis
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile = "householdzip.zip")
#After having extracted the files from the zip folder (manually by user)
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";",na.strings = "?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
hpc_data <- (household_power_consumption$Date== "2007-02-01") | (household_power_consumption$Date== "2007-02-02")
hpc <- household_power_consumption[hpc_data,]

# Plot 2
plot(hpc$Global_active_power,type = "l", 
     ylab="Global Active Power (kilowatts)", xaxt="n")
axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
## Export to png
dev.copy(png,file="A1plot2.png",width=480, height=480)
dev.off() 