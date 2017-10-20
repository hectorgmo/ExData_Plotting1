# Assignment One: Exploratory Data Analysis
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url,destfile = "householdzip.zip")
    #After having extracted the files from the zip folder (manually by user)
    household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";",na.strings = "?")
    household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
    hpc_data <- (household_power_consumption$Date== "2007-02-01") | (household_power_consumption$Date== "2007-02-02")
    hpc <- household_power_consumption[hpc_data,]
    #View(hpc)
 
    # Plot 1
    hist(hpc$Global_active_power, main="Global Active Power",
         ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")
    dev.copy(png,file="plot1.png",width=480, height=480)
    dev.off()
    
    # Plot 2
    plot(hpc$Global_active_power,type = "l", 
         ylab="Global Active Power (kilowatts)", xaxt="n")
    axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
    ## Export to png
    dev.copy(png,file="plot2.png",width=480, height=480)
    dev.off() 
    
    # Plot 3
    png(filename = "plot3.png",width=480, height=480)
    plot(hpc$Sub_metering_1, type = "l", 
         ylab="Energy sub metering",xlab="", xaxt="n")
    axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
    points(hpc$Sub_metering_2, type="l",col="red")
    points(hpc$Sub_metering_3, type="l",col="blue")
    legend("topright",pch = "-", col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off() 
    
    # Plot 4
    png(filename = "plot4.png",width=480, height=480)
    par(mfrow=c(2,2))
    ## Global Active Power
        plot(hpc$Global_active_power,type = "l", 
             ylab="Global Active Power (kilowatts)", xaxt="n")
        axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
    ## Voltage plot
        plot(hpc$Voltage,type = "l", 
             ylab="Voltage",xlab="dateime", xaxt="n")
        axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
    ## Energy sub meeting   
        plot(hpc$Sub_metering_1, type = "l", 
             ylab="Energy sub metering", xaxt="n")
        axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
        points(hpc$Sub_metering_2, type="l",col="red")
        points(hpc$Sub_metering_3, type="l",col="blue")
        legend("topright",pch = "-", col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    ## Global reactive power
        plot(hpc$Global_reactive_power,type = "l", 
             ylab="Global Reactive Power (kilowatts)",xlab="datetime", xaxt="n")
        axis(1, at = c(1,2880/2,2880),labels=c("Thu","Fri","Sat"))
    dev.off()    
    par(mfrow=c(1,1))
    
    