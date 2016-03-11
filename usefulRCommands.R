#remove variable/ object
rm(x)

#Clear your workspace. Removes all variables from the environment
rm(list = ls())

length(object) # number of elements or components
str(object)    # structure of an object 
class(object)  # class or type of an object
names(object)  # names

c(object,object,...)       # combine objects into a vector
cbind(object, object, ...) # combine objects as columns
rbind(object, object, ...) # combine objects as rows 

object     # prints the object

ls()       # list current objects

#creating a function in R
rmse <- function(error)
{
  sqrt(mean(error^2))
}

rmse(2)

#set your working directory
setwd()

#opposite of library
detach("package:ggplot2", unload=TRUE)