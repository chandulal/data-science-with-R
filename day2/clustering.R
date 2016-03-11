data("iris")
iris
irisUnsupervised <- subset(iris, select = -Species)
head(irisUnsupervised)

# k means

km <- kmeans(irisUnsupervised, centers = 4)
str(km)
km$centers
km$cluster
plot(km$cluster)
points(iris$Species, col="red")
# Hierachical clustering

d <- dist(as.matrix(iris[,1:4]))
hcModel <- hclust(d)
plot(hcModel)

hcluster <- hclust(d, method = "ward.D")
plot(hcluster)
rect.hclust(hcluster, k = 3, border = "red")
a <- cutree(hcluster, k = 3)


b <- as.dendrogram(hcluster)
branch1 <- b[[1]]
plot(branch1)


#---clustering on movie dataset


movies <- read.table("dataset/movies/movieLens.txt", header=FALSE, sep = "|", quote = "\"")
str(movies)
colnames(movies) = c("ID", "Title", "ReleaseDate", "VideoReleaseDate", "IMDB", "Unknown", "Action", "Adventure", "Animation", "Childrens", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "FilmNoir", "Horror", "Musical", "Mystery", "Romance", "SciFi", "Thriller", "War", "Western")
str(movies)


#remove unnecessary variables (movie recommendations)

movies$ID = NULL
movies$ReleaseDate = NULL
movies$VideoReleaseDate =NULL
movies$IMDB =NULL

movies <- unique(movies)

str(movies)

summary(movies)

d <- dist(movies[2:20])

clusterMovies <- hclust(d, method = "ward.D")

table(movies$Comedy)
table(movies$Western)
table(movies$Western, movies$Action)

plot(clusterMovies)

clusterGroups <- cutree(clusterMovies, k=10)

tapply(movies$Action, clusterGroups, mean)

subset(movies, Title == "Men in Black (1997)")
clusterGroups[257]

cluster2 <- subset(movies, clusterGroups==2)
cluster2$Title[1:10]

#---anova function ---
library(MASS)
 a <- glm(iris$Sepal.Width ~ iris$Sepal.Length + iris$Petal.Length + iris$Petal.Width, data = iris)
 step <- stepAIC(a, direction="both")
 step$anova

 #----leaps library------
 
 install.packages("leaps")
 library(leaps)
 attach(iris)
 leaps<-regsubsets(iris$Sepal.Width ~ ., data=iris, nbest=3)
 summary(leaps)
 