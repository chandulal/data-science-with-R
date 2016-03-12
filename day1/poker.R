

setwd("/Users/chandukavar/code/bootcamp/data-science")
pokerHandTraining <- read.csv("dataset/Poker Hand/poker-hand-training-true.data")
pokerHandTest <- read.csv("dataset/Poker Hand/poker-hand-testing.data")

names(pokerHandTraining) <- c("Suit1", "Rank1", "Suit2", "Rank2", "Suit3", "Rank3", "Suit4", "Rank4", "Suit5", "Rank5", "Class")
names(pokerHandTest) <- c("Suit1", "Rank1", "Suit2", "Rank2", "Suit3", "Rank3", "Suit4", "Rank4", "Suit5", "Rank5", "Class")

str(pokerHandTraining)
str(pokerHandTest)

cols <- colnames(pokerHandTraining)
pokerTrainingAsFactor <- lapply(pokerHandTraining[,cols], factor)

cols <- colnames(pokerHandTest)
pokerTestAsFactor <- lapply(pokerHandTest[,cols], factor)


#CART model
library(rpart)
library(rpart.plot)

pokerTree <- rpart(pokerHandTraining$Class ~ . , data=pokerTrainingAsFactor, method = "class")

# Plot the tree
prp(pokerTree)

# Make prediction

predictedValues <- predict(pokerTree, newdata = pokerTestAsFactor, type="class")
table(pokerTestAsFactor$Class, predictedValues)

install.packages("randomForest")
library(randomForest)

pokerForest <- randomForest(Class ~ . , data = pokerTrainingAsFactor, ntree=50, nodesize = 5)

#Make prediction

predictedValues <- predict(pokerForest, newdata = pokerTestAsFactor)

table(pokerTestAsFactor$Class, predictedValues)

plot(pokerForest)


