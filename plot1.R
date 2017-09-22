library(dplyr)
library(ggplot2)

unzip("exdata_data_NEI_data.zip",exdir=".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalPM25ByYear <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png",width=480,height=480,unit='px',bg="transparent")

plot(names(totalPM25ByYear), totalPM25ByYear, type = "l",
     xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~ "Emissions"),
     main = expression("Total US" ~ PM[2.5] ~ "Emissions per Year"))

dev.off()