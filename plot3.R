
setwd("C:\\Users\\hassan\\Desktop\\TEST\\data")
path<-"C:\\Users\\hassan\\Desktop\\TEST\\data"
dir()
library(ggplot2)

# READING  The rds file
scc <- readRDS("./Source_Classification_Code.rds")
nei<-readRDS("./summarySCC_PM25.rds")
#head(rds)
#names(nei)

s1<-subset(nei,fips == "24510") 

#tapply return a vector while aggregate returns a matrix with same application
# Aggregate returns the modified matrix ( sum on emission based on both levels of type and year)

s2<- aggregate(Emissions ~ year + type, s1, sum, na.rm=TRUE)

dev.off()

g <- ggplot(s2, aes(year, Emissions, color = type,shape=type))
g <- g + geom_line(size = 1)+
  xlab("year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle('Total Emissions in Baltimore , Maryland versus year')
print(g)
# 
dev.copy(png,file = "plot3.png",width = 480, height = 480)
dev.off()
# 
