# Boston dataset variables:
# LON and LAT are the longitude and latitude of the
# center of the census tract.
# MEDVisthemedianvalueofowner-occupied homes, in thousands of dollars
# CRIM is the per capita crime rate
# ZN is related to how much of the land is zoned for large residential properties
# INDUS is proportion of area used for industry
# CHAS is 1 if the census tract is next to the Charles River
# NOX is the concentration of nitrousoxides in the air
# RM is the average number of rooms per dwelling
# AGE is the proportion of owner-occupied units built before 1940
# DIS is a measure of how far the tract is from centers of employment in Boston
# RAD is a measure of closeness to important highways
# TAX is the property tax rate per$10,000 of value
# PTRATIO is the pupil-teacher ratio by town
# how air polution affects the house prices

#------ reading file --------- 

boston <- read.csv("dataset/house/boston.csv")
str(boston)
summary(boston)

plot(boston$LAT, boston$LON) 

avg <- mean(boston$CHAS)
points(boston$LAT[boston$CHAS >= avg], boston$LON[boston$CHAS >= avg], col="blue", pch=19)

summary(boston$NOX)

avg <- mean(boston$NOX)

points(boston$LAT[boston$NOX >= avg], boston$LON[boston$NOX >= avg], col="red", pch=19)

summary(boston$MEDV)


avg <- mean(boston$MEDV)
points(boston$LAT[boston$MEDV >= avg], boston$LON[boston$MEDV >= avg], col="yellow", pch=19)

avg <- mean(boston$RAD)
points(boston$LAT[boston$RAD >= avg], boston$LON[boston$RAD >= avg], col="green", pch=19)

#------------
latLotModel <- lm(boston$MEDV ~ boston$LAT + boston$LON, data=boston)
summary(latLotModel)

#visualize the output 

plot(boston$LAT, boston$LON)

# what our model predicts more than overage

avg <- mean(boston$MEDV)
points(boston$LAT[boston$MEDV >= avg], boston$LON[boston$MEDV >= avg], col="yellow", pch=19)

# What our model predicts more than average

latLotModel$fitted.values
points(boston$LAT[latLotModel$fitted.values >= avg], boston$LON[latLotModel$fitted.values >=avg], col="gray", pch=19)


#-------------Trees --------------
library(rpart)
library(rpart.plot)

latLonTree <- rpart(boston$MEDV ~ boston$LAT + boston$LON, data=boston)
prp(latLonTree)


# what our model predicts more than overage
plot(boston$LAT, boston$LON)
avg <- mean(boston$MEDV)
points(boston$LAT[boston$MEDV >= avg], boston$LON[boston$MEDV >= avg], col="yellow", pch=19)

# What our model predicts more than average

points(boston$LAT[predict(latLonTree) >= avg], boston$LON[predict(latLonTree) >=avg], col="blue", pch=19)

newLatLonTree <- rpart(boston$MEDV ~ boston$LAT + boston$LON, data =boston, minbucket = 50)
prp(newLatLonTree)

plot(boston$LAT, boston$LON)
abline(h= -71)
abline(v= 42.07)


#----linear regression
