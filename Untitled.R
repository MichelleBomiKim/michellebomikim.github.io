---
Title: "Lab3.qmd"
editor: visual
---
install.packages("haven")
library(haven)
TEDS_2016<-read_stata("https://github.com/datageneration/home/blob/master/DataProgramming/data/TEDS_2016.dta?raw=true")
library(plotly)
library(tidyverse)
#use lm function, 0 constant, 
Petal_lm <- lm(petal. length ~0 + sepal.length + sepal.width,
               data = iris)
