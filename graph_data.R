library(tidyverse)

ggplot(dailyActivity, aes(x = date, y = Calories)) +
  geom_line() +
  geom_smooth()

ggplot(dailyIntensities, aes(x = date, y = Calories, fill = )) +
  geom_bar()