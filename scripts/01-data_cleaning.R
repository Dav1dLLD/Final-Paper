#Purpose: Clean the survey data downloaded from openintro
#Author: Lida Liu
#Data: 25 April 2022
#Contact: lida.liu@utoronto.ca 
library(openintro)
library(tidyverse)
library(ggplot2)
library(mgcv)
library(lme4)
library(readr)
raw_data <- read_csv("C:/R/UK-Smoking/inputs/data/raw_data.csv")
#This process is for data cleaning by choosing the respondents who are smokers 
#from the data set and then create a new data set.
smoker_data <- raw_data%>%
  filter(`smoke` == 'Yes')%>%
  select(gender, age, marital_status, amt_weekdays, 
         amt_weekends, ethnicity, gross_income, region, type)
#Then I create a new variable called smoker, which is a factor 
#variable containing of whether 0 or 1.
raw_data = raw_data %>% mutate(smoker = 
                                 as.factor(ifelse(smoke %in% c("Yes"),1,0)))       
#Next, I calculate the number of cigarettes the respondents smoke per day
#through the calculation of (smoking_per_weekdays + smoking_per_weekends) 
#divided by 2.
smoker_data = smoker_data %>% mutate(smoking_per_day 
                                     = (amt_weekdays+amt_weekends)/2)

