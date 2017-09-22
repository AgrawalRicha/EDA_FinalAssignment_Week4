library(dplyr)
library(ggplot2)

unzip("exdata_data_NEI_data.zip",exdir=".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalBaltimorePM25ByYear <- with(subset(NEI, fips=="24510"),tapply(Emissions, year, sum))

png("plot2.png",width=480,height=480,unit='px',bg="transparent")

plot(names(totalBaltimorePM25ByYear ), totalBaltimorePM25ByYear , type = "l",
     xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~ "Emissions"),
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions per Year"))

dev.off()