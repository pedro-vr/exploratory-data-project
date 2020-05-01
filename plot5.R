# Leemos el archivo
emissions <- readRDS("/Users/pedrovela/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

# Creamos el subconjunto de baltimore y el tipo "on road"
baltimore_car <- subset(emissions, emissions$fips=="24510" 
                             & emissions$type=="ON-ROAD")
baltimore_year <- aggregate(baltimore_car$Emissions, 
                                by=list(baltimore_car$year), FUN=sum)
colnames(baltimore_year) <- c("Year", "Emissions")

# Creamos el plot
png(filename = "plot5.png")
plot(baltimore_year$Year, baltimore_year$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()
