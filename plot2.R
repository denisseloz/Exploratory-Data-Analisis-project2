## setting directory
setwd('C://Users/Denisse/Documents/DenisseR/project2')

## Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC[,c("SCC", "Short.Name")])

##Question 2 

##using dplyr package for %>% function 
install.packages("dplyr")
library(dplyr)

##answering the question
b_total_emissions <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

with(b_total_emissions,
     barplot(height=Emissions/1000, names.arg = year, col = color_range, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Baltimore, Maryland Emissions from 1999 to 2008'))
)
