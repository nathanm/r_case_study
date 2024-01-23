library(tidyverse)
library(lubridate)

dailyActivity <- dailyActivity %>% 
  mutate(date = mdy(ActivityDate))

dailyIntensity <- dailyIntensities %>% 
  mutate(date = mdy(ActivityDay)) #%>% 
  #select(-Id:ActivityDay) %>% 
  pivot_longer(
    cols = SedentaryMinutes:VeryActiveDistance,
    #names_to = c("Sedentary", "LightlyActive", "FairlyActive", "VeryActive"),
    names_to = c(".value","Minutes","Distance")
  )