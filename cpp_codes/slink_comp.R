source("~/cHAC/similarity.R")
library(rioja)

# hclust object using adjClustBand_heap function
# where s_scaled is the similatrity matrix
h<- ncol(s_scaled)
fit <- chaclust(s_scaled,h,f = 1)
plot(fit)
View(cbind(fit$merge ,height = fit$height))

#Recalculating the similarity matrix as s_re = 2-2*s' and rechecking the rioja cluster value
s_re <- 2 - 2*s_scaled

#rioja hclust object
diss <- as.dist(s_re)
clust <- chclust(diss, method = "conslink")
plot(clust)
#doesn't give gain data
View(cbind(clust$merge ,height = clust$height))

# we see that the rioja and adjClustBand_heap give same value of clustering
#when we give scaled matrix s' to adjClustBand_heap and 2-2s' to rioja.

