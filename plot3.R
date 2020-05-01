# Leemos el archivo
emissions <- readRDS("/Users/pedrovela/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#Creamos el subconjunto de datos de baltimore y le agregamops la suma de emisiones por tipo
baltimore <- subset(emissions, emissions$fips=="24510")
baltimore_type <- aggregate(baltimore$Emissions, 
                                 by=list(baltimore$type, baltimore$year), 
                                 FUN=sum)
colnames(baltimore_type) <- c("Type", "Year", "Emissions")

# Creamos el plot con ggplot2
library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = baltimore_type, color = Type, geom = "line") +
  ggtitle("Total Emissions of PM2.5 in Baltimore City by pollutant type") + 
  ylab("Total Emissions (tons)") + 
  xlab("Year") 
dev.off()