install.packages("devtools")
library("devtools")
install.packages("caTools")
library("caTools")
install.packages("ROCR")
library("ROCR")
#-------logistics regressions ----------

quality <- read.csv("dataset/quality.csv")
str(quality)
summary(quality)

pairs(quality)

#base line accuracy

