# Leemos el archivo
emissions <- readRDS("/Users/pedrovela/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

# Creamos el subconjunto de datos de baltimore y le agregamos las emisiones por año
baltimore <- subset(emissions, emissions$fips=="24510")
baltimore_year <- aggregate(baltimore$Emissions, by=list(baltimore$year), 
                                 FUN=sum)
# Creamos el plot
png(filename = "plot2.png")
plot(baltimore_year$Group.1, baltimore_year$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)")
dev.off()