######################################
# Setting up
######################################
rm(list=ls())
setwd("C:/Users/APETERS4/Documents/GitHub/OUHCS-Methods-Practice")

######################################
# Previous examples
######################################

#Play with DAGGITY Package

#LAVAAN

library(lavaan)

fig8.4c <- "#regressions 
Y ~ 1*B + 1*X + 1*U1
B ~ 1*A
X ~ 1*A + 1*U1

#variances and residuals
Y ~~ 1*Y
B ~~ 1*B
A ~~ 1*A
X ~~ 1*X
U1 ~~ 1*U1

#Intercepts and means
Y ~ 0
B ~ 0
A ~ 0
X ~ 0
U1 ~ 0"

# generate data
set.seed(1234)
myData <- simulateData(fig8.4c, sample.nobs=1000L)

# fit model
myModel <- '#regressions 
Y ~ B + X + U1
B ~ A
X ~ A + U1

#variances and residuals
Y ~~ Y
B ~~ B
#A ~~ A
X ~~ X
#U1 ~~ U1

#Intercepts and means
Y ~ 1
B ~ 1
#A ~ 1
X ~ 1
#U1 ~ 1
'
fit <- sem(myModel, data=myData)#, fixed.x=FALSE)
summary(fit)


#Homework: With regards to model 8.3b: Which of these relatinoships gets the direct effect, using observed variables.