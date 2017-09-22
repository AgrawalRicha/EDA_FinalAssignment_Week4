library(dplyr)
library(ggplot2)

unzip("exdata_data_NEI_data.zip",exdir=".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalcombentries<-grepl("Fuel Comb.*Coal",SCC$EI.Sector,ignore.case=TRUE)
coalcomb.df<-SCC[coalcombentries,]
emissions<-NEI[(NEI$SCC %in% coalcomb.df$SCC),]

emissions%>%group_by(year)%>% summarize(emissions=sum(Emissions))->Out.df

png("plot4.png",width=480,height=480,unit='px',bg="transparent")

ggplot(data=Out.df,aes(as.factor(year),emissions))+geom_bar(stat="identity")+xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions"))+ ggtitle("Emissions from Coal Combustion related Sources")

dev.off()