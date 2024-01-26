library(tidyverse)
library(lubridate)

dailyActivity <- dailyActivity %>% 
  mutate(date = mdy(ActivityDate)) %>% 
  select(Id, date, TotalSteps:Calories)

dailyActivity <- dailyActivity %>% 
  mutate(active = VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes)

dailyActivity <- dailyActivity %>% 
  mutate(modActive = VeryActiveMinutes + FairlyActiveMinutes)

dailyActivityNoZero <- dailyActivity %>% 
  filter(TotalSteps > 0, active > 0)

dailyActivityNoModZero <- dailyActivityNoZero %>% 
  filter(modActive > 0)

dailyCalories <- dailyCalories %>% 
  mutate(
    Id = as.character(Id),
    date = mdy(ActivityDay),
    Calories = as.integer(Calories)
  ) %>% 
  select(Id, date, Calories)

Calories <- dailyCalories %>% 
  group_by(Id) %>% 
  summarize(average = mean(Calories)) %>% 
  arrange(-average)

dailySteps <- dailySteps %>% 
  mutate(
    Id = as.character(Id),
    date = mdy(ActivityDay),
    StepTotal = as.integer(StepTotal)
  ) %>% 
  select(Id, date, StepTotal)

Steps <- dailySteps %>% 
  group_by(Id) %>% 
  summarize(average = mean(StepTotal)) %>% 
  arrange(-average)

dailyIntensities <- dailyIntensities %>% 
  pivot_longer(
    cols = !c(Id, ActivityDay),
    names_to = c("intensity", "type"),
    names_pattern = "(.*)(Minutes|Distance)"
  ) %>% 
  mutate(
    date = mdy(ActivityDay),
    intensity = factor(
      intensity,
      levels = c("Sedentary", "SedentaryActive", "LightlyActive", "LightActive", "FairlyActive", "ModeratelyActive", "VeryActive"),
      labels = c("Sedentary", "Sedentary", "LightlyActive", "LightlyActive", "ModeratelyActive", "ModeratelyActive", "VeryActive")
    )
  ) %>% 
  pivot_wider(
    names_from = type,
    values_from = value
  ) %>% 
  select(c(Id, date, intensity, Minutes, Distance))

Intensity <- dailyIntensities %>% 
  group_by(Id, intensity) %>% 
  summarize(average = mean(Minutes))

ActiveIntensity <- Intensity %>% 
  filter(intensity != "Sedentary")
  