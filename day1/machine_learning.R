
#--------linear regression-----------

wine <- read.csv("dataset/wine/wine.csv")
str(wine)
summary(wine)

# linear regression with 1 variable AGST = Average Growing Season Temp

model1 <- lm(Price ~ AGST, data = wine)
summary(model1)

model2 <- lm(Price ~ AGST + Year, data = wine) # + means adding one more field
summary(model2)

model3 <- lm(Price ~ AGST + HarvestRain, data = wine)
summary(model3)


model4 <- lm(Price ~ HarvestRain, data = wine)
summary(model4)


#-----------sum of squared errors----------

#training set

model1$residuals

SSE = sum(model1$residuals^2)
SSE

#-----

wine_test <- read.csv("dataset/wine/wine_test.csv")
str(wine_test)
summary(wine_test)

predictedValues <- predict(model2, newdata = wine_test)
predictedValues

SSE <- sum((wine_test$Price - predictedValues)^2)
SSE
SST <- sum((wine_test$Price - mean(wine$Price))^2)
SST

#R-squared value
1 - SSE/SST

save(model2, file = "model2")
a <-load("model2")
a
model2$coefficients
