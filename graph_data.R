library(tidyverse)

ggplot(dailyActivity, aes(x = date, y = Calories)) +
  geom_line() +
  geom_smooth()

ggplot(dailyCalories, aes(x = date, y = Calories, color = Id)) +
  geom_line()

ggplot(Calories, aes(x = reorder(Id, average), y = average)) +
  geom_col() + 
  coord_flip()

ggplot(dailySteps, aes(x = date, y = StepTotal, color = Id)) +
  geom_line()

ggplot(Steps, aes(x = reorder(Id, average), y = average)) +
  geom_col() + 
  coord_flip()

ggplot(Intensity, aes(x = Id, y = average, fill = intensity)) +
  geom_col()
