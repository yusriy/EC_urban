## Import data "hourly"
hourly_temp <- read.csv('data/hourly.csv')
# Convert date to POSIX
date <- paste(hourly_temp$Date, hourly_temp$Hour)
hourly_temp$Date <- strptime(date, format = '%d/%m/%Y %H:%M', tz = 'Asia/Singapore')
rm(date)

# Plot temperature with time of day
png('hourly_temp.png',res=360,width = 16,height = 8,units = 'cm')
par(mar=c(4.1,4.1,1.1,6.1),xpd=TRUE)
plot(1:24,hourly_temp$Temp[1:24],type='l',ylab='Temperature (Celsius)',
     xlab = 'Time (local time)',lwd = 2, ylim=c(24,34),xaxt='n',lty=1,cex.lab=0.9,
     cex.axis=0.8)
axis(side = 1, at = seq(1,24,by=3), 
     labels = c('00:00','03:00','06:00','09:00','12:00',
                '15:00','18:00','21:00'),cex.axis=0.8)
# Plot the other days
for (i in 1:11) {
  lines(1:24,hourly_temp$Temp[(24*i):((24*i)+23)],lwd = 2, lty=i+1)
}

legend('topright',lty=c(1:12),lwd = c(rep(2,12)),inset = c(-0.22,0),
       legend = c('Mar 14','Apr 14','May 14','Jun 14','Jul 14','Aug 14','Sep 14',
                  'Oct 14','Nov 14','Dec 14','Jan 15','Feb 15'), cex = 0.75,
       title = 'Month')
dev.off()
