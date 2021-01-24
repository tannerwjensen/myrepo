---
title: "Case_Study_3"
author: "Tanner Jensen"
date: "1/22/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## Chart 1
One Variable Quantitative chart 

```{r pressure, echo=FALSE}
ggplot(gapminder, aes(x=lifeExp)) +
  geom_histogram()
```

This chart displays the overall life expectancy worldwide, and shows that the most common life expectancy averages around 70-75 years old. 

## Chart 2 
One Variable Qualitative chart

```{r pressure, echo=FALSE}
ggplot(gapminder, aes(x = factor(continent))) + 
  geom_bar(fill = "brown", color = "black")
```

This chart displays the number of countries per continent. Africa, having the most, comes out the highest with Oceania as the lowest. 

## Chart 3 
Two Variable Bivariate Distribution

```{r pressure, echo=FALSE}
ggplot(data = gapminder, mapping = aes(x = lifeExp, y = gdpPercap)) + 
  geom_point(mapping = aes(color = continent)) 
```

This chart shows the GDP per capita with the life expectancies for all countries. On average, the european coutnries have the highest GDP per capita whereas the african countries have many of the lowest. Oceania follows a pattern similar to europe whereas the americas and asia are averaged out along the whole curve. 

## Chart 4
Recreated Chart

```{r}
gapminder %>% 
  filter(country != "Kuwait") %>% 
ggplot() + 
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, size = pop/100000, color = continent)) +
  scale_y_continuous(trans = "sqrt") +
  labs(y="GDP Per Capita", x = "Life Expectancy", size = "Population") +
  facet_grid(. ~ year)
```


