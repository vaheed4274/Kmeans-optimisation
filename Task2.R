#Importing Dataset
irisData=read.csv('Iris.csv',header=TRUE)
#Data Preprocessing
print(dim(irisData))
str(irisData)
head(irisData)
summary(irisData)
Species = irisData$Species
print(head(Species))
irisData=irisData[,-c(1,6)] #Remove non-numeric data
print(head(irisData))
#finding Optimal cluster using elbow method
k.values = 2:15
wss = c()
for(i in k.values){
  res = kmeans(irisData,centers=i,iter.max = 10)$tot.withinss
  wss = append(wss,res)
}
print(wss)
plot(k.values, wss,type="b",
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")
#Results say that k=3 is optimum number of centers
kmeans.res = kmeans(irisData,centers=3,iter.max = 10)
print(kmeans.res)
clusters = kmeans.res$cluster
print(clusters)
centers = kmeans.res$centers
print(centers)


