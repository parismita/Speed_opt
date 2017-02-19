library("adjclust")
library("snpStats")

data("ld.example", package="snpStats")
p <- ncol(ceph.1mb)
nSamples <- nrow(ceph.1mb)
#ld data
ld.ceph <- ld(ceph.1mb, stats="R.squared", depth=p-1)
image(ld.ceph)

h <- 50
ld.ceph <- ld(ceph.1mb, stats="R.squared", depth=h)
image(ld.ceph)
# cluster and find dendograms of ld data
fit <- adjclust:::adjClustBand_heap(ld.ceph@x, p, h, blMin=1)
plot(fit,hang=-1)
rect.hclust(fit, k = 10)

## some reshaping
ld <- ld.ceph
image(ld)
#making diagonal = 1 as it is required for similarity kernel
diag(ld) <- 1
x <- t(ld)@x
x <- matrix(x,nrow = 604, ncol = 48)
View(x)
resP <- adjclust:::HeapHop(x, p, h, 1)
View(resP)
plot(resP[1,],resP[2,])




hc = hclust(d = x, method = 'ward.D')
View(hc)
y_hc = cutree(hc,4)
diss=as.matrix(diss)


clusplot(diss, y_hc, lines = 0, color = TRUE)
