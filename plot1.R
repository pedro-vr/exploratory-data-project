# Leemos el archivo
emissions <- readRDS("/Users/pedrovela/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

#Agregamos el total de emisiones por cada año
by_year <- aggregate(emissions$Emissions, by=list(year=emissions$year), FUN=sum)

# Creamos el plot
png(filename = "plot1.png")
plot(by_year$year, by_year$x, type = "l", 
     main = "Total Emissions of PM2.5 by year",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()