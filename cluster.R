library(fpc)
library(NbClust)
library(cluster)
library(ggplot2)
library(factoextra)
#Normalizar los datos
scaledf<-scale(df)
#Calcular la optimo de cluster en este caso se ultiliza el kmeans pero puede aplicarse otros algoritmos para conformar los clusters cambiando el nombre del algoritmo en el código. 
f1.1<-fviz_nbclust(scaledf, kmeans, method = "wss",k.max=8) #k.max=8 es un valor arbitrario, se puede aumentar o reducir según convenga
f1.2<-fviz_nbclust(scaledf, kmeans, method = "silhouette",k.max=8)
require(gridExtra)
require(grid)
f1<-grid.arrange(f1.1,f1.2,nrow=1,top=textGrob("Número óptimo de clusters por los métodos WSS y Silueta", gp=gpar(fontsize=15,font=2)))
#Crear los cluster 
kmeans <- kmeans (scaledf, 2) # 2 es el número de cluster, se escoge según el resultado anterior o a conveniencia.
print(kmeans)
fviz_cluster(kmeans, data = scaledf)
#Observar las características de los clusters
df %>%
  mutate(Cluster = kmeans$clustering) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

#Se incluye el cluster como factor
df$clus<-as.factor(kmeans$clustering)
summary(df$clus)
