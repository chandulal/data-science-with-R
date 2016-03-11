
setwd("/Users/chandukavar/code/bootcamp/data-science")
library("devtools")
install_github('evaluatingModel','ShraddhaSurana')
library(ROCR)
library(caTools)
library(evaluatingModel)
?performanceMeasure

#---------logistic regression ------

quality <- read.csv("dataset/quality.csv")
str(quality)
summary(quality)

#baseline accuracy

table(quality$PoorCare)

predict <- sample(c(0,1), 20, replace=T)
true <- sample(c(0,1), 20, replace=T)

retrieved <- sum(predict)

precision <- sum(predict & true) / retrieved

recall <- sum(predict & true) / sum(true)

Fmeasure <- 2 * precision * recall / (precision + recall)





