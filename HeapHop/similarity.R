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
Dkk <- sum(K^2)
s <- c()
for (i in 1:n) {
  Dik <- sum(K[i,]^2)
  for (j in 1:n) {
    Dkj <- sum(K[,j]^2)
    Dij <- K[i,j]^2
    #the equation
    sij <- -0.5*(Dij - 1/n*(Dik+Dkj) + 1/n^2*Dkk)
    s <- c(s,sij)
    }
}

# the similarity matrix
s <- matrix(s , nrow = 150,ncol = 150)
image(s)
p<-150
h <- 5

# using function chaclust to get HeapHop object
resP <- chaclust(s,h)


View(resP)
head(t(resP))

