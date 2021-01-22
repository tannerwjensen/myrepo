---
title: "Task_6"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


# Original Graph

``` {r}
library(readr) #opens readr package
library(ggplot2) #opens ggplot2 package 


#opens and stores csv file data as a data set for R to use
rcw <- read_csv("https://byuistats.github.io/M335/data/rcw.csv", 
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"), 
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))
head(rcw) # Displays first rows present 
 

ggplot(data = rcw, #Selects data set
       mapping = aes(x = Semester_Date, #Selects x variable
                     y = Count, #Selects y variable
                     color = Department)) + #Assigns each Department it's own color 
  geom_line() + 
  geom_point()
```

Based on the following graph, total overall participation has decreased over the past few years whereas collective participation within departments increased. In the first couple years, the ME and CSEE departments had a high number of participants that more than made up for the other departments. As time went on, ME and CSEE dropped slightly while there were greater participants in the other departments. 

# New Graph 

``` {r}
head(rcw)
ggplot(data = rcw, mapping = aes(x = Semester_Date, y = Count)) + 
  geom_point(mapping = aes(color = Department)) + 
  geom_smooth()

```
  

  
  
  
  
  