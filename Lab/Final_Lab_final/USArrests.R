dataset = read.csv("USArrests.csv")
str(dataset)
summary(dataset)

#Z-score normalization 
nor_dataset=scale(dataset[,-1])
nor_dataset

install.packages("ClusterR")
install.packages("factoextra")
library(ClusterR)
library(factoextra)
#
fviz_nbclust(nor_dataset, kmeans, method = "wss")

# install.packages("animation")
# library(animation)
# set.seed(2345)
# kmeans.ani(dataset,4)

# install.packages("ggfortify")
# kmean = kmeans(dataset,4)
# autoplot(kmean, dataset, frame = TRUE)

#info about kmeans
km = kmeans(nor_dataset, centers = 4, nstart = 25)
km

#shows cluster for every instance 
dataset_member = cbind(dataset, cluster=km$cluster)
dataset_member
#visualize cluster
fviz_cluster(km,data=nor_dataset)

#mean of cluster
aggregate(USArrests, by=list(cluster=km$cluster),mean)
