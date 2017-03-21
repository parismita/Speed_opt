#This is a example to obtain constrained HAC using dataset extracted from dissimilarity.txt

#reading dataset from txt file
data <- read.table("/home/parismita/cHAC/dissimilarity.txt")
#converting to numeric list
n<-as.numeric(unlist(data))
#converting to dissimilarity matrix
dmat<-matrix(c(n),nrow = 77,ncol = 77)
#View(dmat)

library(rioja)
library(cluster)

#we are given with dissimilarity matrix with id not euclidean distance metric.
#changing to distance class
dmat <- as.dist(dmat)
#chclust function for Constrained hierarchical clustering method, using consiss method
clust <- chclust(dmat)

#plotting variances of ordination axes/components and overlaying broken stick distributions
bstick(clust, ng = 10)
plot(clust, hang=-1 )


#chclust function for Constrained hierarchical clustering method, using conslink method
clust <- chclust(dmat, method = "conslink")

#plotting variances of ordination axes/components
#plot(clust, hang=-1 )


hc = hclust(d = dmat, method = 'ward.D')
y_hc = cutree(hc,6)
diss=as.matrix(dmat)

#clusplot(diss, y_hc, lines = 0, color = TRUE)


