#import Data set
Data_iris=read.csv(file.choose(),header =T)
Data_iris

Species=as.factor(Species)
Species


Data_iris=Data_iris[,2:5]
Data_iris

Data_iris=data.frame(Data_iris,Species)
Data_iris

attach(Data_iris)
summary(Data_iris)
str(Data_iris)

#loading library
library(rpart)
library(caret)
library(Fselector)
library(dplyr)
library(rpart.plot)
library(data.tree)
library(ggplot2)


#encoding the target factor as a feature
Data_iris$Species=as.numeric(Species)
Data_iris

#Data partition
indices=createDataPartition(Species,p=.8,list=FALSE)
indices
indices=as.vector(indices)
indices

train_set= Data_iris[indices,]
train_set
test_set =Data_iris[-indices,]
test_set

#creating decision model
library(rpart)
model=rpart(train_set$Species~.,data=train_set,method="class")
model

y_pred=predict(model,test_set[,1:4],type="class")
y_pred


#Accuracy testing by matrix
table(y_pred,test_set$Species)

#visulization
library(rattle)
fancyRpartPlot(model)

