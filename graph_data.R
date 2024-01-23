library(tidyverse)

ggplot(dailyActivity, aes(x = ActivityDate, y = TotalSteps)) +
  geom_line(se = FALSE)