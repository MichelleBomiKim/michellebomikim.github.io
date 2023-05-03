d <- X6323rawdata_1_
library("dplyr")
f<-d[,c('BEDS')]
library('dplyr')
count(f)
t<-d[,c('BATHS')]
count(t)
z <-d[,c('ZIP OR POSTAL CODE')]
count(z)
zb<-d[,c('BEDS','BATHS','ZIP OR POSTAL CODE')]
x <- z
y <- t
count(zb)
