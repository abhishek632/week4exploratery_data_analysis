emissions_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")
baltimore_data<-subset(emissions_data,emissions_data$fips=="24510")
year_wise<- aggregate(baltimore_data$Emissions,by=list(baltimore_data$type,baltimore_data$year),FUN=sum)
colnames(year_wise)<-c("Type","Year","Emission")
library(ggplot2)
png(filename = "plot3.png")
qplot(Year,Emission,data=year_wise,color=Type,geom="line")+
ggtitle("Total Emmision Type wise")+ylab("Total Emission")+xlab("Year")