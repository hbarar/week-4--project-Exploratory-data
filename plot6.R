
setwd("C:\\Users\\hassan\\Desktop\\TEST\\data")
dir()
library(ggplot2)

# READING  The rds file
scc <- readRDS("./Source_Classification_Code.rds")
nei<-readRDS("./summarySCC_PM25.rds")


#Subsetting based on "Coal"
selected<-subset(nei,(nei$fips=="24510"|nei$fips=="06037") & nei$type=="ON-ROAD")

# apply sum on emission coloumn but based on the different levels of "year"
matrix<- aggregate(Emissions ~ year+fips ,selected, sum)
matrix$fips[matrix$fips=="24510"] <- "Baltimore, MD"
matrix$fips[matrix$fips=="06037"] <- "Los Angeles, CA"
#=================================================================
dev.off()
g <- ggplot(matrix, aes(year, Emissions,col=fips))
g <- g + geom_point(size = 5 ,pch=20)+
  xlab("year") +
  ylab("Total Emissions") +
  ggtitle('Total Emissions - comparison between Baltimore and LosAngeles')+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
print(g)
#
dev.copy(png,file = "plot6.png",width = 480, height = 480)
dev.off()
#
