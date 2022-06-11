
# Preparing Data, Setting language
data<-read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",)
data_Feb<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
remove (data)

Date_new<-as.Date(data_Feb$Date, format = "%d/%m/%Y")
datetime<-strptime(paste(data_Feb$Date,data_Feb$Time), format("%d/%m/%Y %H:%M:%S") )
data_Feb<-cbind(data_Feb, Date_new ,datetime )
remove(datetime, Date_new)

# Setting language
Sys.setlocale("LC_ALL", "English")


# Plot 1
with(data_Feb, hist(Global_active_power,
     col="red", 
     main="Global Active Power",
     xlab="Global Active Power (Kilowatts)",
     ))


# Save the plot to a PNG file 
png(file="plot1.png", width = 480, height = 480)
dev.off()
