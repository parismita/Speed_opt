# this is the function to take similarity matrix as input and give HeapHop clustered object as output

-library("adjclust")
-library("Matrix")

chaclust<-function(s,h,f = 0){
  p <- ncol(s)
  # extracting diagonal band
  low <- 1
  high <- h
  delta <- col(s) - row(s)
  s[delta < low | delta > high] <- 0
  
  #create sparse mmatrix of dgCMatric class
  A <- as(s, "sparseMatrix")
  x <- A@x
  
  if(f==1){
    fit <- adjclust:::adjClustBand_heap(x,p,h,blMin = 1)
    return(fit)
  }

  resP <- adjclust:::HeapHop(x, p, h, 1)
  return(resP)
}
#chaclust(s,5)

