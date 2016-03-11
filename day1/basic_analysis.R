#load iris

data("iris")

#basic data analysis

mean(iris$Sepal.Length)
sd(iris$Sepal.Length)
summary(iris$Sepal.Length)

#index

min(iris$Sepal.Length)
which.min(iris$Sepal.Length)
iris[132,]

#scatterplot

plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Length)
plot(iris$Petal.Length)

pairs(iris)

#histogram

hist(iris$Sepal.Length)
hist(iris$Petal.Length)
hist(iris$Sepal.Length, breaks = c(4, 4.1, 4.2, 4.3, 6, 7,8))

#boxplot

boxplot(iris$Sepal.Length ~ iris$Species)
boxplot(iris$Petal.Length ~ iris$Species)
boxplot(iris$Petal.Length ~ iris$Species, xlab = "x", ylab="Sepal Length")

#summary tables

table(iris$Species)
a <- table(iris$Sepal.Length)
b <- data.frame(a)

#----tapply ---
tapply(iris$Sepal.Length, iris$Species, mean)

tapply(iris$Sepal.Length, iris$Species, sqrtt)

sqrtt <- function(x) {
  sqrt(mean(x))
}


?tapply
?apply
?mapply
