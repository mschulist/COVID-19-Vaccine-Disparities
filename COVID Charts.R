library("tidyverse")
library(readr)
library(data.table)

COVID_DATA <- fread('https://covid.ourworldindata.org/data/owid-covid-data.csv')

Date = COVID_DATA$date

Partial_COVID_Data <- COVID_DATA %>%
  mutate(Date=as.Date(Date, format= "%m/%d/%y"))%>% 
  group_by(location) %>%  
  arrange(desc(Date)) %>%
  slice(1)

Partial_COVID_Data[c("total_vaccinations_per_hundred")][is.na(Partial_COVID_Data[c("total_vaccinations_per_hundred")])] <- 0

continent = Partial_COVID_Data$continent
gdp = Partial_COVID_Data$gdp_per_capita
vaccine = Partial_COVID_Data$total_vaccinations_per_hundred

ggplot()+
geom_point(data = Partial_COVID_Data, mapping = aes(x = gdp, y = vaccine, color = continent))+
geom_smooth(data = Partial_COVID_Data, mapping = aes(x = gdp, y = vaccine), method = "lm", se = FALSE, color = "red")+
labs(title = paste("Plot of GDP Per Capita and \nCOVID-19 Vaccines Per 100 People", Sys.Date(), sep = " "),
     x = "GDP Per Capita", y = "COVID-19 Vaccines Per 100 People")
