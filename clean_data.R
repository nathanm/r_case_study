library(tidyverse)
library(lubridate)

dailyActivity %>% 
  mutate(date = myd(ActivityDate))
