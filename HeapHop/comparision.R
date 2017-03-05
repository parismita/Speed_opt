source("~/cHAC/similarity.R")
library(rioja)



#rioja hclust object
diss <- dist(K)
clust = chclust(diss)
plot(clust, hang=-1 )
bstick(clust, ng = 10)
#doesn't give gain data
View(head(cbind(clust$merge , clust$height)))



#hclust object in R
hc = hclust(d = diss, method = 'ward.D')
y_hc = cutree(hc,6)
plot(hc)
diss=as.matrix(diss)
clusplot(diss, y_hc, lines = 0, color = TRUE)



# hclust object using adjClustBand_heap function
# where s is the similatrity matrix
fit <- chaclust(s,h,f = 1)
plot(fit)
View(head(cbind(fit$merge ,fit$gains , clust$height)))

#Heaphop cluster object, as it is not hclust object hence we can't plot it
#but we can compare the merge and gain data
resP <- chaclust(s,h)
View(head(t(resP)))
