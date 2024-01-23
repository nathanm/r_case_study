library(tidyverse)

ggplot(dailyActivity, aes(x = date, y = Calories)) +
  geom_line() +
  geom_smooth()