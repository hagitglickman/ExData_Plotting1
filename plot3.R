
# Preparing Data 
data<-read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",)
data_Feb<-subset(data, Date %in% c("1/2/2007","2/2/2007"))
remove (data)

Date_new<-as.Date(data_Feb$Date, format = "%d/%m/%Y")
datetime<-strptime(paste(data_Feb$Date,data_Feb$Time), format("%d/%m/%Y %H:%M:%S") )
data_Feb<-cbind(data_Feb, Date_new ,datetime )
remove(datetime, Date_new)

# Setting language
Sys.setlocale("LC_ALL", "English")


# plot 3
with(data_Feb,{
     plot(datetime,Sub_metering_1,
          type="l",
          xlab=" ",
          ylab="Energy Sub Metering",
          col="black"
          )
     points(datetime,Sub_metering_2,
          type="l",
          xlab=" ",
          ylab=" ",
          col="red"
          )
     points(datetime,Sub_metering_3,
          type="l",
          xlab=" ",
          ylab=" ",
          col="blue"
          )
     })

legend("topright", lty =1, col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      ) 

# Save the plot to a PNG file 
png(file="plot3.png", width = 480, height = 480)
dev.off()
