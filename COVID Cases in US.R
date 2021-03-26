library("tidyverse")
library(readr)
library(data.table)

COVID_DATA <- fread('https://covid.ourworldindata.org/data/owid-covid-data.csv')

country = COVID_DATA$location

US_Data <- filter(COVID_DATA, country == "United States")

continent = Partial_COVID_Data$continent
gdp = Partial_COVID_Data$gdp_per_capita
vaccine = Partial_COVID_Data$total_vaccinations_per_hundred
date = US_Data$date
cases = US_Data$new_cases

ggplot()+
  geom_point(data = US_Data, mapping = aes(x = date, y = cases,))+
  geom_smooth(data = US_Data, mapping = aes(x = date, y = cases), se = FALSE, color = "red")+
  labs(title = paste("Cases in US Over Time \n", Sys.Date(), sep = " "),
       x = "Date", y = "Cases")