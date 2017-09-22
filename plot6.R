library(dplyr)
library(ggplot2)

unzip("exdata_data_NEI_data.zip",exdir=".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

CityData <- subset(NEI, (fips=="24510" | fips=="06037") & type=="ON-ROAD")
CityData %>% group_by(year,fips) %>% summarize(emissions=sum(Emissions))->out.df
out.df<-transform(out.df,city=ifelse(fips=="24510","Baltimore City", "Los Angles"))

png("plot6.png",width=480,height=480,unit='px',bg="transparent")
qplot(as.factor(year),emissions,data=out.df,color=city)+facet_grid(.~city)+geom_bar(stat="identity")+xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions"))+ggtitle("Emissions for Baltimore City and Los Angles")
dev.off()  