
library(dplyr)
library(ggplot2)

unzip("exdata_data_NEI_data.zip",exdir=".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips=="24510" & type=="ON-ROAD")
baltimore%>% group_by(year) %>% summarize(emissions=sum(Emissions))->Out.df

png("plot5.png",width=480,height=480,unit='px',bg="transparent")

qplot(year,emissions,data=Out.df,geom="line") + ggtitle(expression("Baltimore" ~ PM[2.5] ~ "Motor Vehicle Emissions"))+xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions"))

dev.off()