library(tidyverse)

ggplot(dailyActivity, aes(x = date, y = Calories)) +
  geom_line() +
  geom_smooth()

ggplot(dailyCalories, aes(x = date, y = Calories, color = Id)) +
  geom_line()

ggplot(Calories, aes(x = Id, y = average)) +
  geom_col()

ggplot(dailyIntensities, aes(x = date, y = Calories, fill = )) +
  geom_bar()