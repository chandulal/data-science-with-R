#---- measuring performance ----
install.packages("devtools")
library("devtools")
library(ROCR)
library(caTools)
install_github('evaluatingModel','ShraddhaSurana',force = TRUE)
library(evaluatingModel)
?performanceMeasure

install.packages("caTools")
install.packages("ROCR")

#---- Logistic Regression ----
quality <- read.csv("dataset/quality.csv")
str(quality)
summary(quality)

#Baseline accuracy
table(quality$PoorCare)

98/(98+33)

library(caTools)
set.seed(88)
split <- sample.split(quality$PoorCare, SplitRatio = 0.75)
split

#Create train and test sets
qualityTrain <- subset(quality, split == TRUE)
qualityTest <- subset(quality, split == FALSE)
a<-quality[split,]
b<-quality[!split,]

# Run logistic regression model

qualityLogistic <- glm(PoorCare ~ . , data=qualityTrain, family=binomial)
summary(qualityLogistic)

predictedTrain <- predict(qualityLogistic, type="response")
predictedTrain

summary(predictedTrain)
tapply(predictedTrain, qualityTrain$PoorCare, mean)

head(predictedTrain)

table(qualityTrain$PoorCare, predictedTrain > 0.5)
a <- performanceMeasure(qualityTrain$PoorCare, predictedTrain > 0.5)
a <- performanceMeasure(qualityTrain$PoorCare, predictedTrain > 0.7)
a <- performanceMeasure(qualityTrain$PoorCare, predictedTrain > 0.2)
a <- performanceMeasure(qualityTrain$PoorCare, predictedTrain > 0.8)
a <- performanceMeasure(qualityTrain$PoorCare, predictedTrain > 0.6)

#confusion matrix

#sensitivity

#specificity

#precision recall

# How to pick a good threshold value?
library(ROCR)

#Prediction function
ROCRpred <- prediction(predictedTrain, qualityTrain$PoorCare)

#Performance
ROCRperf <- performance(ROCRpred, "tpr", "fpr")

#Plot ROC Curve
plot(ROCRperf)

plot(ROCRperf, colorize=TRUE)
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))





