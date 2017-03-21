library(rioja)
library("matrixStats")
source("~/cHAC/chaclust.R")

#reading dataset from txt file
data <- read.table("/home/parismita/cHAC/dissimilarity2.txt")
#converting to numeric list
n<-as.numeric(unlist(data))
#converting to dissimilarity matrix
K<-matrix(c(n),nrow = 150,ncol = 150)
#View(K)

# algo to calculate similarity matrix s from the equation given where 
#K is the dissimilatriy matrix delta(xi,xj)
#Dkk is sum[k,k':1 to n](delta(xk,xk')^2), Dij is delta(xi,xj)^2,
#Dik and Dkj is sum[k:1 to n](delta(xi,xk)^2) and sum[k:1 to n](delta(xk,xj)^2) resp
n <- 150
K <- K^2
Dkk <- sum(K)
Dij <- K
Dik <- apply(K, 1, sum)
Dkj <- apply(K, 2, sum)
Dikkj <- 1/n*outer(Dik,Dkj,FUN = '+')
Dk <- matrix(1/n^2*Dkk,nrow=150,ncol=150,byrow=TRUE)

# the similarity matrix
s <- -0.5*(Dij - Dikkj + Dk)

# scaling of the similarity matrix and making diagonal column as 1,
# as required by adjClustBand_heap
s_scaled <- sweep(s,1,sqrt(diag(s)),'/')
s_scaled <- sweep(s_scaled,2,sqrt(diag(s)),'/')

#image(sp)
p<-150
h <- 5

# using function chaclust to get HeapHop object
resP <- chaclust(s_scaled,h)


View(resP)
head(t(resP))

