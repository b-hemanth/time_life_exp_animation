library(tidyverse)
library(devtools)
library(gganimate)
library(gapminder)
library(gifski)
library(png)
gapminder %>%
  filter(continent %in% c("Americas", "Africa", "Asia")) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, color = continent, size = pop, alpha = pop)) + 
  geom_point() +
  scale_x_log10() +
  transition_states(year,
                    transition_length = 2,
                    state_length = 1) +
  facet_wrap(~continent) +
  ggtitle("The World Gets Better Every Year: {year}")