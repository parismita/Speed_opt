library(kernlab)
library(rioja)
library("matrixStats")
library("snpStats")

#reading dataset from txt file
data <- read.table("/home/parismita/dissimilarity2.txt")
#converting to numeric list
n<-as.numeric(unlist(data))
#converting to dissimilarity matrix
K<-matrix(c(n),nrow = 150,ncol = 150)
#View(K)

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
image(s)
p<-150
h <- 5

# extracting diagonal band
# as adjClustBand_heap accepts band except the diagonal hence removing the diagonal
low <- 1
high <- h
delta <- col(s) - row(s)
s[delta < low | delta > high] <- 0
View(s)
image(s)


#convert to dcgMatrix class object
A <- as(s, "sparseMatrix")
image(A)
## some reshaping
#diag(A) <- 1
x <- t(A)@x

fit <- adjclust:::adjClustBand_heap(x, p, h, blMin=1)
plot(fit)

resP <- adjclust:::HeapHop(x, p, h, 1)
View(resP)

#comparision
diss <- dist(K)
hc = hclust(d = diss, method = 'ward.D')
y_hc = cutree(hc,6)
plot(hc)
diss=as.matrix(diss)
clusplot(diss, y_hc, lines = 0, color = TRUE)
clusplot(s, y_hc, lines = 0, color = TRUE)
