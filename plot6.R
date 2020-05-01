# Leemos el archivo
emissions <- readRDS("/Users/pedrovela/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

# Creamos el subconjunto de baltimore y LA junto con el tipo "on road"
baltLA_car <- subset(emissions, emissions$fips=="24510" |
                            emissions$fips=="06037" &
                            emissions$type=="ON-ROAD")
baltLA_year <- aggregate(baltLA_car$Emissions, 
                             by=list(baltLA_car$fips, baltLA_car$year),
                             FUN=sum)
colnames(baltLA_year) <- c("City", "Year", "Emissions")

# Creamos el plot con ggplot2 
library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = baltLA_year, color = City, geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + 
  ylab("Total Emissions from motor vehicles (tons)") + 
  xlab("Year") 
dev.off()