## setting directory
setwd('C://Users/Denisse/Documents/DenisseR/project2')

## Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC[,c("SCC", "Short.Name")])

##Question 1 

total_annual_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)
color_range <- 2:(length(total_annual_emissions$year)+1)
with(total_annual_emissions, 
     barplot(height=Emissions/1000, names.arg = year, col = color_range, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))
