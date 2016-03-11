#----applying linear regression ----

boston <- read.csv("dataset/house/boston.csv")
boston$TRACT=NULL
boston$TOWN = NULL
str(boston)
summary(boston)

set.seed(123)
split <- sample.split(boston$MEDV, SplitRatio = 0.7)
split
 
 #Create train and test sets
 qualityTrain <- subset(boston, split == TRUE)
 qualityTest <- subset(boston, split == FALSE)
 
 # linear regression
 
 latLonLinearModel <- lm(MEDV ~ . , data=qualityTrain)
 summary(latLonLinearModel)
 
 predictedValues <- predict(latLonLinearModel,qualityTest)
 actualValues <- qualityTest$MEDV
 
 rsq <- 1-sum((actualValues-predictedValues)^2)/sum((actualValues-mean(qualityTrain$MEDV))^2)
 print(rsq)
 
 #tree model
 
 latLonTree <- rpart(MEDV ~ . , data=qualityTrain)
 prp(latLonTree)

 predictedValues <- predict(latLonTree,qualityTest)
 actualValues <- qualityTest$MEDV
 
 rsq <- 1-sum((actualValues-predictedValues)^2)/sum((actualValues-mean(qualityTrain$MEDV))^2)
 print(rsq)
 
 