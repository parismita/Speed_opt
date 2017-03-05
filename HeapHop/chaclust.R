library("adjclust")
library("Matrix")

chaclust<-function(s,h){
  p<- ncol(s)
  # extracting diagonal band
  low <- 1
  high <- h
  delta <- col(s) - row(s)
  s[delta < low | delta > high] <- 0
  
  #create sparse mmatrix of dgCMatric class
  A <- as(s, "sparseMatrix")
  x <- A@x
  
  resP <- adjclust:::HeapHop(x, p, h, 1)
  return(resP)
}
#chaclust(s,5)
