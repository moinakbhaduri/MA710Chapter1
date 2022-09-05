#--Speeches condemning the Holocaust---#

#library(igraph) #--Basic creation and handling of "graph" objects--#
#library(network) #--Basic creation and handling of "network" objects--#
#library(intergraph) #--To switch back and forth between "graph" and "network" objects--#
#library(statnet) #--For basic network plots like gplots--#
#library(networkD3) #--To create interactive visuals--#
#library(visNetwork) #--To create interactive visuals--#
#library(networkDynamic) #--To analyse networks that evolve over time--#
#library(tsna) #--Another package to analyse networks that evolve over time--#
#library(UserNetR) #--Contains some network data sets--#

#--Let's first construct the edge-list--#
edges=data.frame(Holocaust$source,Holocaust$target)
edges

holocaust.network=network(edges,matrix.type="edgelist") #--notice how "remember" is linked with "remember" (row number 199); these are called loops--#
holocaust.network.loops=network(edges,matrix.type="edgelist",loops = T,multiple = T) #--if we want to allow those loops--#
summary(holocaust.network.loops)

#--A basic plot, hard to see--#
gplot(holocaust.network.loops,displaylabels = T)

#--Let's create a simpler version first without loops and multiple edges--#
holocaust.simple=simplify(asIgraph(holocaust.network.loops), remove.loops = T, remove.multiple = T)

#--Let's see the adjacency matrix--#
get.adjacency(holocaust.simple) #--notice it's non-symmetric--#

#--Let's convert it to an undirected network--#
holocaust.undirected=as.undirected(holocaust.simple,mode=c("collapse"))
get.adjacency(holocaust.undirected) #--now it becomes symmetric--#

holocaust.simple.undirected.network=asNetwork(holocaust.undirected)
gplot(holocaust.simple.undirected.network,displaylabels = T)

#---The five number summary for the full network---#
network.size(holocaust.simple.undirected.network)
gden(holocaust.simple.undirected.network)
is.connected(holocaust.simple.undirected.network) #--is the thing connected? Polite inquiry on the network--#
is_connected(holocaust.undirected,mode = c("strong")) #--is the thing connected? Polite inquiry on the graph--#
components(holocaust.simple.undirected.network)
max(geodist(component.largest(holocaust.simple.undirected.network,result = "graph"))$gdist)
diameter(asIgraph(holocaust.simple.undirected.network)) #--another way to get the diameter, asIgraph (from intergraph) converts a network object to a graph object--#
diameter(holocaust.undirected)
gtrans(holocaust.simple.undirected.network,mode="graph") #--not well-defined for multigraphs--#

###--The degree distribution--####
degree(holocaust.simple.undirected.network)
fit_power_law(degree(holocaust.simple.undirected.network))
hist(degree(holocaust.simple.undirected.network),freq = F,main = "Degree distibution, Holocaust (full)",xlab="Degree")

#####################

#--Now, on to the stricter network--#
tolerance=5
Holocaust.Subset=subset(Holocaust,Holocaust$sentences>tolerance)
dim(Holocaust.Subset)

edges.subset=data.frame(Holocaust.Subset$source,Holocaust.Subset$target)
holocaust.subset.network.loops=network(edges.subset,matrix.type="edgelist",loops = T,multiple = T)

gplot(holocaust.subset.network.loops,displaylabels = T,size=5,label.cex = 0.5)

#--Let's create a simpler version first without loops and multiple edges--#
holocaust.subset.simple=simplify(asIgraph(holocaust.subset.network.loops), remove.loops = T, remove.multiple = T)
#--Let's convert it to an undirected network--#
holocaust.subset.undirected=as.undirected(holocaust.subset.simple,mode=c("collapse"))
get.adjacency(holocaust.subset.undirected)
holocaust.subset.simple.undirected.network=asNetwork(holocaust.subset.undirected)
gplot(holocaust.subset.simple.undirected.network,displaylabels = T)

#---The five number summary for the smaller network---#
network.size(holocaust.subset.simple.undirected.network)
gden(holocaust.subset.simple.undirected.network)
components(holocaust.subset.simple.undirected.network)
max(geodist(component.largest(holocaust.subset.simple.undirected.network,result = "graph"))$gdist)
diameter(asIgraph(holocaust.subset.simple.undirected.network),directed = F,unconnected = T)
gtrans(holocaust.subset.simple.undirected.network,mode="graph")

is_connected(asIgraph(holocaust.subset.simple.undirected.network))

#------------Hierarchical automacy---#

tol=seq(0,33,1)

m=matrix(0,length(tol),5)
for(i in 1:length(tol))
{
  Holocaust.Subset=subset(Holocaust,Holocaust$sentences>tol[i])
  edges.subset=data.frame(Holocaust.Subset$source,Holocaust.Subset$target)
  holocaust.subset.network.loops=network(edges.subset,matrix.type="edgelist",loops = T,multiple = T)
  holocaust.subset.simple=simplify(asIgraph(holocaust.subset.network.loops), remove.loops = T, remove.multiple = T)
  holocaust.subset.undirected=as.undirected(holocaust.subset.simple,mode=c("collapse"))
  holocaust.subset.simple.undirected.network=asNetwork(holocaust.subset.undirected)
  
  m[i,1]=network.size(holocaust.subset.simple.undirected.network)
  m[i,2]=gden(holocaust.subset.simple.undirected.network)
  m[i,3]=components(holocaust.subset.simple.undirected.network)
  m[i,4]=diameter(asIgraph(holocaust.subset.simple.undirected.network),directed = F,unconnected = T)
  m[i,5]=gtrans(holocaust.subset.simple.undirected.network,mode="graph")
}

m

par(mfrow=c(2,2))
plot(tol,m[,1],"l",xlab="Tolerance",ylab = "Network size")
plot(tol,m[,2],"l",xlab="Tolerance",ylab = "Network density")

plot(tol,m[,3],"l",xlab="Tolerance",ylab = "Components and diameter")
lines(tol,m[,4],col="red")
legend(14,9,c("Components","Diameters"),col=c("black","red"),lty=c(1,1))

plot(tol,m[,5],"l",xlab="Tolerance",ylab = "Clustering coefficient")


#--For slightly better graphics---#
#library(networkD3)
tolerance=5
Holocaust.Subset5=subset(Holocaust,Holocaust$sentences>tolerance)
edges.subset5=data.frame(Holocaust.Subset5$source,Holocaust.Subset5$target)
simpleNetwork(edges.subset5,height="100px", width="100px",opacity = 0.9,zoom = T) #--this needs an edge-list--#

#---Is annihilation a remedy?---#
tol=seq(0,33,1)

m2=matrix(0,length(tol),4)
for(i in 1:length(tol))
{
  Holocaust.Subset=subset(Holocaust,Holocaust$sentences>tol[i])
  edges.subset=data.frame(Holocaust.Subset$source,Holocaust.Subset$target)
  holocaust.subset.network.loops=network(edges.subset,matrix.type="edgelist",loops = T,multiple = T)
  holocaust.subset.simple=simplify(asIgraph(holocaust.subset.network.loops), remove.loops = T, remove.multiple = T)
  holocaust.subset.undirected=as.undirected(holocaust.subset.simple,mode=c("collapse"))
  holocaust.subset.simple.undirected.network=asNetwork(holocaust.subset.undirected)
  
  m2[i,1]=fit_power_law(degree(holocaust.subset.simple.undirected.network))$alpha
  m2[i,2]=fit_power_law(degree(holocaust.subset.simple.undirected.network))$xmin
  m2[i,3]=fit_power_law(degree(holocaust.subset.simple.undirected.network))$KS.stat
  m2[i,4]=fit_power_law(degree(holocaust.subset.simple.undirected.network))$KS.p
  
}

m2

par(mfrow=c(2,2))
plot(tol,m2[,1],"l",xlab="Tolerance",ylab="Power-law alpha")
plot(tol,m2[,2],"l",xlab="Tolerance",ylab="Power-law x-minimum")
plot(tol,m2[,3],"l",xlab="Tolerance",ylab="Power-law KS statistic")
plot(tol,m2[,4],"l",xlab="Tolerance",ylab="Power-law p-value")

#########################################################################################################
#components(holocaust.subset.network.loops)

library(intergraph)

which(edges.subset$Holocaust.Subset.source==edges.subset$Holocaust.Subset.target)#--no loops--#


edges.subset=unique(edges.subset)

holocaust.igraph=asIgraph(holocaust.subset.network.loops)
holocaust.adjacency=as.matrix(holocaust.igraph, matrix.type = c("adjacency"))

as.sociomatrix(holocaust.subset.network.loops)
library(circlize)

chordDiagram(as.matrix(holocaust.igraph, matrix.type = c("adjacency")))

holocaust.igraph
