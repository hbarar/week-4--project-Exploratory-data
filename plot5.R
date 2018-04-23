
setwd("C:\\Users\\hassan\\Desktop\\TEST\\data")
dir()
library(ggplot2)

# READING  The rds file
scc <- readRDS("./Source_Classification_Code.rds")
nei<-readRDS("./summarySCC_PM25.rds")
#MERGING 2 data based on the SCC number
nesteddata<-merge(nei,scc,by="SCC")
dim(nei);dim(scc);dim(nesteddata)

#Subsetting based on "Coal"
selected<-subset(nesteddata,nesteddata$type=="ON-ROAD" & nesteddata$fips=="24510")

# apply sum on emission coloumn but based on the different levels of "year"
matrix<- aggregate(Emissions ~ year ,selected, sum, na.rm=TRUE)
#=================================================================
 dev.off()
g <- ggplot(matrix, aes(year, Emissions))
g <- g + geom_point(size = 5 ,pch=20,col="blue")+
  xlab("year") +
  ylab("Total Emissions") +
  ggtitle('Total Emissions form Coal')+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
print(g)
#
dev.copy(png,file = "plot5.png",width = 480, height = 480)
dev.off()
#
