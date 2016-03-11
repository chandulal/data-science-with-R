library(ggplot2)
install.packages("ggplot2")

WHO <- read.csv("dataset/WHO/WHO.csv")

str(WHO)
head(WHO)
summary(WHO)

a <- WHO[WHO["Country"] == "India",]
a

#---------using ggplots----------

scatterPlot <- ggplot(WHO, aes(x=GNI, y=FertilityRate ))
scatterPlot + geom_point()
scatterPlot + geom_line()
scatterPlot + geom_point()


scatterPlot + geom_point(color="blue", size = 3, shape = 4)
scatterPlot + geom_point(color="red", size = 2, shape = 8) + geom_line()
plotToSave <-  geom_point(color="red", size = 2, shape = 8) + geom_line()

pdf("pdfForPlot.pdf")
print(plotToSave)
dev.off()


# ----


ggplot(WHO, aes(x=GNI, y = FertilityRate, color=Region)) + geom_point()

ggplot(WHO, aes(x = FertilityRate, y = Under15)) + geom_point()

ggplot(WHO, aes(x=GNI, y = FertilityRate, color=Region)) + geom_point()


cor(WHO$LifeExpectancy, WHO$GNI)
cor(WHO$Population, WHO$Under15)


#linear regression

lmModel <- lm(Under15 ~ FertilityRate, data = WHO)
summary(lmModel)

ggplot(WHO, aes(x=log(FertilityRate), y=Under15)) + geom_point() + stat_smooth(method="lm")
ggplot(WHO, aes(x=log(FertilityRate), y=Under15)) + geom_point() + stat_smooth(method="lm", se = FALSE, color = "red")

