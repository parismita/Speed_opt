#This is a example to show use of rioja function chclust to obtain constrained HAC
#using dataset RLGH (Diatom stratigraphic data) given in the package

library(rioja)
data(RLGH)
#diss is computed distance matrix of diatomic species relative abundance 
diss <- dist(sqrt(RLGH$spec/100))

#chclust function for Constrained hierarchical clustering method coniss
clust <- chclust(diss)
#plotting variances of ordination axes/components and overlaying broken stick distributions
bstick(clust, 19)
bstick(clust)
# Basic diagram
plot(clust, hang=-1)

# observations plotted according to sample depth.
plot(clust, xvar=RLGH$depths$Depth, hang=-1)

# Conslink for comparison
clust <- chclust(diss, method = "conslink")
plot(clust, hang=-1)
