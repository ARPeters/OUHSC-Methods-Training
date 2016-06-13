######################################
# Setting up
######################################
rm(list=ls())
setwd("C:/Users/APETERS4/Documents/GitHub/OUHSC-Methods-Training")

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


#Homework: With regards to model 8.3b: Which of these relationships gets the direct effect, using observed variables. 
#(i.e. which of these variables satisfies the single-door criterion for some relationship(?))

#      U2
#    /   \
#   X1--> Y1 <--.
#  /        \    \
# U1        Y3   U3 
#  \        /     /
#  X2 --> Y2 <---'

#Covariates Z satisfy the single-door criterion for variables X,Y if:
#1) Z is not a descendent of Y
#2) If you delete the X->Y edge of the model, Z d-separates X and Y 

fig8.3b <- "#regressions 
Y3 ~ 1*Y1 + 1*Y2
Y1 ~ 1*X1 + 1*U2 + 1*U3
Y2 ~ 1*X2 + 1*U3
X1 ~ 1*U1 + 1*U2
X2 ~ 1*U1

#variances and residuals
Y1 ~~ 1*Y1
Y2 ~~ 1*Y2
Y3 ~~ 1*Y3
X1 ~~ 1*X1
X2 ~~ 1*X2
U1 ~~ 1*U1
U2 ~~ 1*U2
U3 ~~ 1*U3

#Intercepts and means
Y1 ~ 0
Y2 ~ 0
Y3 ~ 0
X1 ~ 0
X2 ~ 0
U1 ~ 0
U2 ~ 0
U3 ~ 0"

# generate data
set.seed(1234)
myData <- simulateData(fig8.3b, sample.nobs=1000L)

#fit model
testModel<-"#regressions 
Y3 ~ Y1 + Y2
Y1 ~ X1 + U2 + U3
Y2 ~ X2 + U3
X1 ~ U1 + U2
X2 ~ U1

#variances and residuals
Y1 ~~ Y1
Y2 ~~ Y2
Y3 ~~ Y3
# X1 ~~ X1
# X2 ~~ X2
# U1 ~~ U1
# U2 ~~ U2
# U3 ~~ U3

#Intercepts and means
Y1 ~ 0
Y2 ~ 0
Y3 ~ 0
# X1 ~ 0
# X2 ~ 0
# U1 ~ 0
# U2 ~ 0
# U3 ~ 0
"
fit<-sem(testModel, data=myData)
summary(fit)
