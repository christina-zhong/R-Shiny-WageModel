setwd("/coursera/developingDataProducts/project")

library(ISLR)
data(Wage)
head(Wage)
library(caret)
?Wage
summary(Wage)
wages<-subset(Wage,select=-c(sex,region,logwage))
names(wages)
inTrain<-createDataPartition(y=wages$wage,p=0.7,list=FALSE)
training<-wages[inTrain,]
testing<-wages[-inTrain,]
dim(training)
dim(testing)
modFit<-train(wage~.,data=training,method="lm")
mod<-modFit$finalModel
mod
mod$coef
pred<-predict(modFit,testing)
qplot(wage,pred,data=testing)
plot(mod,1,pch=19,cex=0.5,col="#00000010")
qplot(mod$fitted,mod$residuals,colour=race,data=training)
plot(mod,pch=19)

install.packages("shiny")
library(shiny)
runExample("01_hello")

martialv<-function(x) {
    if (x == 1) {
        c(1,0,0,0)
    } else if (x == 2) {
        c(0,1,0,0)
    }
}

class(martialv(2))

y<-martialv(2)
y
y[1]
y[2]
x<-1:20
class(x)
x[5]
x[20]

round(12.345678,2)

