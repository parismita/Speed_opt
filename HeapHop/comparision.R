source("~/cHAC/similarity.R")
library(rioja)



#rioja hclust object
diss <- as.dist(K)
clust <- chclust(diss)
plot(clust)
#bstick(clust, ng = 10)
#doesn't give gain data
View(head(cbind(clust$merge ,height = clust$height)))



# hclust object using adjClustBand_heap function
# where s_scaled is the scaled similatrity matrix
#case 1
h<-5
fit <- chaclust(s_scaled,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))


# hclust object using adjClustBand_heap function
# where s_scaled is the similatrity matrix
#case 2
h<-20
fit <- chaclust(s_scaled,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))


# hclust object using adjClustBand_heap function
# where s_scaled is the similatrity matrix
#case 3
h<- ncol(s_scaled)
fit <- chaclust(s_scaled,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))

#Recalculating the similarity matrix as s_re = 2-2*s' and rechecking the rioja cluster value
s_re <- 2 - 2*s_scaled

#rioja hclust object
diss <- as.dist(s_re)
clust <- chclust(diss)
plot(clust)
bstick(clust, ng = 10)
#doesn't give gain data
View(head(cbind(clust$merge ,height = clust$height)))

# we see that the rioja and adjClustBand_heap give same value of clustering
#when we give scaled matrix s' to adjClustBand_heap and 2-2s' to rioja.
