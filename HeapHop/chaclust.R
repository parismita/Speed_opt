library("adjclust")
library("Matrix")

chaclust<-function(s,h){
  p<- ncol(s)
  # extracting diagonal band
  low <- -h
  high <- h
  delta <- row(s) - col(s)
  s[delta < low | delta > high] <- 0
  
  #create sparse mmatrix of dgCMatric class
  A <- as(s, "sparseMatrix")
  diag(A) <- 1
  x <- t(A)@x
  
  resP <- adjclust:::HeapHop(x, p, h, 1)
  plot(resP[1,],resP[2,])
  return(resP)
}
chaclust(s,5)
