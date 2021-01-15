---
title: "Exploratory Data Analysis"
author: "YOUR NAME"
date: "January 12, 2021"
output:
  html_document:  
    keep_md: true
    toc: true
    toc_float: true
    fig_height: 6
    fig_width: 12
    fig_align: 'center'
---



## Reading Notes

- A variable is categorical if it can only take one of a small set of values. 

- A variable is continuous if it can take any of an infinite set of ordered values.

- Typical values are easy to interpret and visualize; Unusual values are outliers and easy to identify in a graph. 

- The mutate() and ifelse() functions can be used to replace unusual or missing values (as NA) without having to delete the entire row.

- Covariation is the tendancy for the values of two or more variables to vary together in a related way. 

- Density is the count standardised so that the area under each frequency polygon is one. 

- A boxplot is a type of visual shorthand for a distribution of values. 

- Various geometric functions can be used to clean up the data (geom_count, geom_tile, geom_point, geom_histogram, etc). 

## EDA Example

The code below is an example of the EDA process using the `starwars` data from the `tidyverse` package. (Make sure you have the `tidyverse` package installed!)

Run the code line-by-line and look at the output. Add a comment to each line of code that explains what it does/what insights it provides.


```r
library(tidyverse) #Imports tidyverse 

dim(starwars) #Dim function sets the dimension of the specific matrix 
```

```
## [1] 87 14
```

```r
colnames(starwars) #Creates separate columns for each of the variables
```

```
##  [1] "name"       "height"     "mass"       "hair_color" "skin_color"
##  [6] "eye_color"  "birth_year" "sex"        "gender"     "homeworld" 
## [11] "species"    "films"      "vehicles"   "starships"
```

```r
head(starwars) #Displays  the first n rows present in input data
```

```
## # A tibble: 6 x 14
##   name  height  mass hair_color skin_color eye_color birth_year sex   gender
##   <chr>  <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
## 1 Luke…    172    77 blond      fair       blue            19   male  mascu…
## 2 C-3PO    167    75 <NA>       gold       yellow         112   none  mascu…
## 3 R2-D2     96    32 <NA>       white, bl… red             33   none  mascu…
## 4 Dart…    202   136 none       white      yellow          41.9 male  mascu…
## 5 Leia…    150    49 brown      light      brown           19   fema… femin…
## 6 Owen…    178   120 brown, gr… light      blue            52   male  mascu…
## # … with 5 more variables: homeworld <chr>, species <chr>, films <list>,
## #   vehicles <list>, starships <list>
```

```r
glimpse(starwars) #Similar to a print statement but displays data running down a page
```

```
## Rows: 87
## Columns: 14
## $ name       <chr> "Luke Skywalker", "C-3PO", "R2-D2", "Darth Vader", "Leia O…
## $ height     <int> 172, 167, 96, 202, 150, 178, 165, 97, 183, 182, 188, 180, …
## $ mass       <dbl> 77.0, 75.0, 32.0, 136.0, 49.0, 120.0, 75.0, 32.0, 84.0, 77…
## $ hair_color <chr> "blond", NA, NA, "none", "brown", "brown, grey", "brown", …
## $ skin_color <chr> "fair", "gold", "white, blue", "white", "light", "light", …
## $ eye_color  <chr> "blue", "yellow", "red", "yellow", "brown", "blue", "blue"…
## $ birth_year <dbl> 19.0, 112.0, 33.0, 41.9, 19.0, 52.0, 47.0, NA, 24.0, 57.0,…
## $ sex        <chr> "male", "none", "none", "male", "female", "male", "female"…
## $ gender     <chr> "masculine", "masculine", "masculine", "masculine", "femin…
## $ homeworld  <chr> "Tatooine", "Tatooine", "Naboo", "Tatooine", "Alderaan", "…
## $ species    <chr> "Human", "Droid", "Droid", "Human", "Human", "Human", "Hum…
## $ films      <list> [<"The Empire Strikes Back", "Revenge of the Sith", "Retu…
## $ vehicles   <list> [<"Snowspeeder", "Imperial Speeder Bike">, <>, <>, <>, "I…
## $ starships  <list> [<"X-wing", "Imperial shuttle">, <>, <>, "TIE Advanced x1…
```

```r
?starwars #Gives an explanation regarding the starwars data set

starwars %>% count(species) #Counts the number of species in the starwars data set 
```

```
## # A tibble: 38 x 2
##    species       n
##    <chr>     <int>
##  1 Aleena        1
##  2 Besalisk      1
##  3 Cerean        1
##  4 Chagrian      1
##  5 Clawdite      1
##  6 Droid         6
##  7 Dug           1
##  8 Ewok          1
##  9 Geonosian     1
## 10 Gungan        3
## # … with 28 more rows
```

```r
mean(starwars$height) #Calculates the average height of starwars characters in the data set
```

```
## [1] NA
```

```r
mean(starwars$height, na.rm = TRUE) #Calculates the average height of starwars characters in the data set, but excludes values with NA from the calculation.
```

```
## [1] 174.358
```

```r
summary(starwars$height) #Five-number-summary of the character heights in the data set
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    66.0   167.0   180.0   174.4   191.0   264.0       6
```

```r
cm_to_ft <- function(cm){
  ft = cm / 30.48
  return(ft)
} #Converts the centimeters to feet for future calculations

starwars_2 <- starwars %>% mutate(height_ft = cm_to_ft(height)) #Creates copy of original data set for calculation of character height using feet instead of centimeters

dim(starwars_2) #Sets dimention of matrix of new data set
```

```
## [1] 87 15
```

```r
colnames(starwars_2) # Creates separate columns for each of the variables in the new data set
```

```
##  [1] "name"       "height"     "mass"       "hair_color" "skin_color"
##  [6] "eye_color"  "birth_year" "sex"        "gender"     "homeworld" 
## [11] "species"    "films"      "vehicles"   "starships"  "height_ft"
```

```r
summary(starwars_2$height_ft) #Five-number-summary of the new starwars data set
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##   2.165   5.479   5.906   5.720   6.266   8.661       6
```

```r
ggplot(starwars_2, aes(height_ft)) + 
  geom_histogram() #Creates a ggplot using the heights in feet with the number of occurances 
```

```
## Warning: Removed 6 rows containing non-finite values (stat_bin).
```

![](task3_template_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
starwars_2 %>% filter(height_ft == max(height_ft)) #Realigns the data with all respective variables
```

```
## # A tibble: 0 x 15
## # … with 15 variables: name <chr>, height <int>, mass <dbl>, hair_color <chr>,
## #   skin_color <chr>, eye_color <chr>, birth_year <dbl>, sex <chr>,
## #   gender <chr>, homeworld <chr>, species <chr>, films <list>,
## #   vehicles <list>, starships <list>, height_ft <dbl>
```

```r
starwars_2 %>% filter(height_ft == max(height_ft, na.rm = TRUE)) #Displays the character Yarael Poof and it's respective variable information 
```

```
## # A tibble: 1 x 15
##   name  height  mass hair_color skin_color eye_color birth_year sex   gender
##   <chr>  <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
## 1 Yara…    264    NA none       white      yellow            NA male  mascu…
## # … with 6 more variables: homeworld <chr>, species <chr>, films <list>,
## #   vehicles <list>, starships <list>, height_ft <dbl>
```

```r
# https://starwars.fandom.com/wiki/Yarael_Poof
```

## EDA Practice

Continue exploring the `starwars` data to gain additional insights, using [R4DS: Chapter 7](https://r4ds.had.co.nz/exploratory-data-analysis.html) as a guide.

It is ok if you don't understand the all code in Chapter 7. (That is what we'll be learning the next two weeks!) If writing your own code is a struggle, try the "copy, paste, and tweak" method.


```r
# your code goes here
```
