
setwd("C:\\Users\\hassan\\Desktop\\TEST\\data")
path<-"C:\\Users\\hassan\\Desktop\\TEST\\data"
dir()


# READING  The rds file
scc <- readRDS("./Source_Classification_Code.rds")
nei<-readRDS("./summarySCC_PM25.rds")
#head(rds)
#names(nei)

s1<-subset(nei,year=="1999" & fips == "24510") ;m1<-sum(s1$Emissions,na.rm=TRUE)
s2<-subset(nei,year=="2002" & fips == "24510") ;m2<-sum(s2$Emissions,na.rm=TRUE)
s3<-subset(nei,year=="2005" & fips == "24510") ;m3<-sum(s3$Emissions,na.rm=TRUE)
s4<-subset(nei,year=="2008" & fips == "24510") ;m4<-sum(s4$Emissions,na.rm=TRUE)
maxdata<-data.frame(year=as.numeric(c("1999","2002","2005","2008")),total=c(m1,m2,m3,m4))


# 
dev.off()
par(mar = c(5,7,4,2) + 0.1)
plot.new( xaxt = "n", yaxt = "n")  #activate the graphics device in R

with(maxdata,plot(year,total,type="b",pch=20,cex=3,col=y,lwd=1,
                  main="total emissions from PM2.5 in the Baltimore city-Maryland",
                  xlab="",
                  ylab="",
                  yaxt='n',xaxt='n'))


axis(1, at=maxdata$year)
axis(2, at=maxdata$total,las=2)  ## las=1 : shows the numbers perpendicular to the axis
title(xlab="year", cex.lab = 1.2,col.lab="blue")
title(ylab="Total amount PM2.5", cex.lab = 1.2,line = 5.0,col.lab="blue")

dev.copy(png,file = "plot2.png",width = 480, height = 480)
dev.off()

