#----set working directory ---

setwd("/Users/chandukavar/code/bootcamp/data-science/")
getwd()

#load file

iris <- read.csv("dataset/Irisdata/irisdata.csv", header = FALSE)
str(iris)
data(iris)
str(iris)
summary(iris)

#subset

iris_setosa <- subset(iris, Species == "setosa")
iris_setosa
str(iris_setosa)
summary(iris_setosa)

iris_raw <- data.frame(Sepal.Length=2.3,Sepal.Width=4.5,Petal.Length=1.2, Petal.Width=5.6, Species="setaosa")

a <- rbind(iris_setosa, iris_raw)
str(a)

iris_setosa[2,]
head(iris_setosa)

#write

write.csv(iris_setosa, "newDataset.csv")
