#This is a example to obtain constrained HAC using dataset extracted from dissimilarity.txt

#reading dataset from txt file
data <- read.table("/home/parismita/dissimilarity.txt")
#converting to numeric list
n<-as.numeric(unlist(data))
#converting to dissimilarity matrix
dmat<-matrix(c(n),nrow = 77,ncol = 77)
#View(dmat)

library(rioja)
library(cluster)

#as it is not euclidian dissimilarity matrix we have to find distance matrix by other methods

#case 1
#diss is computed distance matrix of dissimilarity matrix power of p >1
diss <- dist(dmat, method='canberra')
#diss <- dist(dmat, method='minkowski',p = 1)
#chclust function for Constrained hierarchical clustering method, using coniss method
clust <- chclust(diss)

#plotting variances of ordination axes/components and overlaying broken stick distributions
bstick(clust, ng = 10)
plot(clust, hang=-1 )

hc = hclust(d = diss, method = 'ward.D')
y_hc = cutree(hc,6)
diss=as.matrix(diss)

clusplot(diss, y_hc, lines = 0, color = TRUE)

