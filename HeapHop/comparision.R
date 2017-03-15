source("~/cHAC/similarity.R")
library(rioja)



#rioja hclust object
diss <- dist(K)
clust <- chclust(diss)
plot(clust)
#bstick(clust, ng = 10)
#doesn't give gain data
View(head(cbind(clust$merge ,height = clust$height)))



# hclust object using adjClustBand_heap function
# where s is the similatrity matrix
#case 1
h<-1
fit <- chaclust(s,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))


# hclust object using adjClustBand_heap function
# where s is the similatrity matrix
#case 2
h<-10
fit <- chaclust(s,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))


# hclust object using adjClustBand_heap function
# where s is the similatrity matrix
#case 3
h<-15
fit <- chaclust(s,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))


# hclust object using adjClustBand_heap function
# where s is the similatrity matrix
#case 4
h<-25
fit <- chaclust(s,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))

# hclust object using adjClustBand_heap function
# where s is the similatrity matrix
#case 5
h<-45
fit <- chaclust(s,h,f = 1)
plot(fit,hand = 0)
View(head(cbind(fit$merge ,gain = fit$gains , height = clust$height)))

