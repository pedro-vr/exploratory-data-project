# Leemos el archivo
emissions <- readRDS("/Users/pedrovela/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")

# Buscamos los datos que involucren a "coal"
coal_code <- class_code[grepl("Coal", class_code$Short.Name), ]
coal_emissions <- emissions[emissions$SCC %in% coal_code$SCC, ]

# Sumamos las emisione por año
coal_year <- aggregate(coal_emissions$Emissions, 
                                 by=list(coal_emissions$year), FUN=sum)
colnames(coal_year) <- c("year", "emissions")

# Creamos el plot 
png(filename = "plot4.png")
plot(coal_year$year, coal_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()