#This is a example to obtain constrained HAC using dataset extracted from dissimilarity.txt

#reading dataset from txt file
data <- read.table("/home/parismita/dissimilarity.txt")
#converting to numeric list
n<-as.numeric(unlist(data))
#converting to dissimilarity matrix
dmat<-matrix(c(n),nrow = 77,ncol = 77)
View(dmat)

library(rioja)

#diss is computed distance matrix of dissimilarity matrix 
diss <- dist(sqrt(dmat/100), method = "euclidean" )
#chclust function for Constrained hierarchical clustering method coniss
clust <- chclust(diss)
#plotting variances of ordination axes/components and overlaying broken stick distributions
bstick(clust, 15)
bstick(clust)
# Basic diagram
plot(clust, hang=-1)


# Conslink for comparison
clust <- chclust(diss, method = "conslink")
plot(clust, hang=-1)
