library(tidyverse)
library(lubridate)

dailyActivity <- dailyActivity %>% 
  mutate(date = mdy(ActivityDate))
