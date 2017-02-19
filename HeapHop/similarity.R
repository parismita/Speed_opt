library(kernlab)
library(rioja)
library("matrixStats")
library("snpStats")

#reading dataset from txt file
data <- read.table("/home/parismita/dissimilarity2.txt")
#converting to numeric list
n<-as.numeric(unlist(data))
#converting to dissimilarity matrix
dmat<-matrix(c(n),nrow = 150,ncol = 150)
#View(dmat)

# Gaussian Kernel Matrix
K<-kernelMatrix(kernel = rbfdot(sigma = 0.1) , as.matrix(dmat))
View(K)

# algo to calculate similarity matrix s from the equation given where D is delta, K is kernel 
#Dkk is sum[k,k':1 to n](delta(xk,xk')), Dij is delta(xi,xj), Dik and Dkj is sum[k:1 to n](delta(xi,xk)) and sum[k:1 to n](delta(xk,xj)) resp
n <- 150
Dkk <- sum(K^2)
s <- c()
for (i in 1:n) {
  Dik <- sum(K[i,]^2)
  for (j in 1:n) {
    Dkj <- sum(K[,j]^2)
    Dij <- K[i,j]^2
    sij <- -0.5*(Dij - 1/n*(Dik+Dkj) + 1/n^2*Dkk)
    s <- c(s,sij)
    }
}

# the similarity matrix
s <- matrix(s , nrow = 150,ncol = 150)


l <- 5
# extracting diagonal band
low <- -l
high <- l
delta <- row(s) - col(s)
s[delta < low | delta > high] <- 0
View(s)
image(s)

A <- as(s, "sparseMatrix")
image(A)

## some reshaping
diag(A) <- 1
x <- t(A)@x
resP <- adjclust:::HeapHop(x, 150, h, 1)
View(resP)
plot(resP[1,],resP[2,])

