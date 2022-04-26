#Purpose: Clean the survey data downloaded from openintro
#Author: Lida Liu
#Data: 25 April 2022
#Contact: lida.liu@utoronto.ca 
library(readr)
raw_data <- read_csv("C:/R/UK_Smoking/inputs/data/raw_data.csv")
smoker_data <- raw_data%>%
  filter(`smoke` == 'Yes')%>%
  select(gender, age, marital_status, amt_weekdays, 
         amt_weekends, ethnicity, gross_income, region, type)
raw_data = raw_data %>% mutate(smoker = 
                                 as.factor(ifelse(smoke %in% c("Yes"),1,0)))       
smoker_data = smoker_data %>% mutate(smoking_per_day 
                                     = (amt_weekdays+amt_weekends)/2)
