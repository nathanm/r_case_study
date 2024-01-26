library(tidyverse)

ggplot(dailyActivity, aes(x = date, y = Calories)) +
  geom_line() +
  geom_smooth()

ggplot(dailyActivity, aes(x = TotalSteps, y = Calories)) +
  geom_point() +
  xlim(0,25000) + # 3 obs > 25k skew the smoothed conf int
  geom_smooth()

ggplot(dailyActivity, aes(x = active, y = Calories)) +
  geom_point() +
  geom_smooth()

ggplot(dailyActivity, aes(x = modActive, y = Calories)) +
  geom_point() +
  geom_smooth()

ggplot(dailyActivityNoZero, aes(x = TotalSteps, y = Calories)) +
  geom_point() +
  geom_smooth()

ggplot(dailyActivityNoZero, aes(x = active, y = Calories)) +
  geom_point() +
  geom_smooth()

ggplot(dailyActivityNoModZero, aes(x = modActive, y = Calories)) +
  geom_point() +
  geom_smooth()

ggplot(dailyCalories, aes(x = date, y = Calories, color = Id)) +
  geom_line(show.legend = FALSE)

ggplot(Calories, aes(x = reorder(Id, average), y = average)) +
  geom_col() + 
  scale_x_discrete(name = "users", labels = NULL)

ggplot(dailySteps, aes(x = date, y = StepTotal, color = Id)) +
  geom_line(show.legend = FALSE)

ggplot(Steps, aes(x = reorder(Id, average), y = average)) +
  geom_col() + 
  scale_x_discrete(name = "users", labels = NULL)

ggplot(Intensity, aes(x = reorder(factor(Id), -average), y = average, fill = intensity)) +
  geom_col() +
  scale_x_discrete(name = "users", labels = NULL)

ggplot(ActiveIntensity, aes(x = reorder(factor(Id), -average), y = average, fill = intensity)) +
  geom_col() +
  scale_x_discrete(name = "users", labels = NULL)
