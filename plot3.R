library(dplyr)
library(ggplot2)

unzip("exdata_data_NEI_data.zip",exdir=".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subset(NEI, fips=="24510")%>% group_by(year,type)%>% summarize(emissions=sum(Emissions))->Out.df

png("plot3.png",width=480,height=480,unit='px',bg="transparent")

qplot(year,emissions,data=Out.df,color=type,geom="line")+ggtitle(expression("Baltimore total"~PM[2.5]~"Emissions by Type"))+ xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions"))

dev.off()