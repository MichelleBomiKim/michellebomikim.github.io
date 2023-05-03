#practice ch 10 
#single layer network on the hitters data
install.packages("ISLR2")
library(ISLR2)
Gitters <- na.omit(Hitters)
n <- nrow(Gitters)
set.seed(13)
ntest <- trunc(n / 3)
testid <- sample(1:n, ntest)

lfit <- lm(Salary ~ . , data = Gitters[-testid, ])
lpred <- predict(lfit, Gitters[testid, ])
with(Gitters[testid, ], mean(abs(lpred - Salary)))

x <- scale(model.matrix(Salary ~ . - 1, data = Gitters)) #modelmatrix that produces the same matrix that was used by lm 
y <- Gitters$Salary
#lm the -1 omits the intercept this function automatically conerts factors to dummy variables. 
#scale function stnadardized the matrix so each column has mean ero and variance one. 

library(glmnet)
cvfit <- 
