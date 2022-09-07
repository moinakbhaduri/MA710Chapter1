#library(igraph) #--Basic creation and handling of "graph" objects--#
#library(network) #--Basic creation and handling of "network" objects--#
#library(intergraph) #--To switch back and forth between "graph" and "network" objects--#
#library(statnet) #--For basic network plots like gplots--#
#library(networkD3) #--To create interactive visuals--#
#library(visNetwork) #--To create interactive visuals--#
#library(networkDynamic) #--To analyse networks that evolve over time--#
#library(tsna) #--Another package to analyse networks that evolve over time--#
#library(UserNetR) #--Contains some network data sets--#


AdjacencyMatrix1<-matrix(0,6,6)
AdjacencyMatrix1[1,]=c(0,1,1,0,0,1)
AdjacencyMatrix1[2,]=c(0,0,1,1,0,0)
AdjacencyMatrix1[3,]=c(0,1,0,0,0,1)
AdjacencyMatrix1[4,]=c(0,0,0,0,0,0)
AdjacencyMatrix1[5,]=c(0,0,1,0,0,1)
AdjacencyMatrix1[6,]=c(1,0,1,1,0,0)

#--Giving names to the nodes---#
rownames(AdjacencyMatrix1)<-c("A","B","C","D","E","F")
colnames(AdjacencyMatrix1)<-c("A","B","C","D","E","F")

Network1<-network(AdjacencyMatrix1,matrix.type="adjacency")
summary(Network1)

#--A basic plot--#
gplot(Network1,vertex.col = 2,displaylabels = TRUE)

#--Check its size (how many nodes we have)--#
network.size(Network1)

#--Check its density--#
gden(Network1)

#--library(xtable), just for teaching purposes--#
xtable(AdjacencyMatrix1, type = "latex", file = "AdjacencyMatrix1.tex")

#--Next, an UNdirected network---#
AdjacencyMatrix2<-matrix(0,6,6)
AdjacencyMatrix2[1,]=c(0,1,1,0,0,1)
AdjacencyMatrix2[2,]=c(1,0,1,1,0,0)
AdjacencyMatrix2[3,]=c(1,1,0,0,0,1)
AdjacencyMatrix2[4,]=c(0,1,0,0,0,0)
AdjacencyMatrix2[5,]=c(0,0,0,0,0,1)
AdjacencyMatrix2[6,]=c(1,0,1,0,1,0)
#--Giving names to the nodes---#
rownames(AdjacencyMatrix2)<-c("A","B","C","D","E","F")
colnames(AdjacencyMatrix2)<-c("A","B","C","D","E","F")

Network2<-network(AdjacencyMatrix2,matrix.type="adjacency",directed = F)
summary(Network2)

gplot(Network2,vertex.col = 2,displaylabels = TRUE)

#--the five number summary--#
network.size(Network2)
gden(Network2)
components(Network2)
largest.component=component.largest(Network2,result = "graph")
geodist(largest.component)
max(geodist(largest.component)$gdist)
diameter(asIgraph(Network2))
gtrans(Network2,mode = "graph")
#--node centrality--#
degree(Network2,gmode = "graph")
#--library(xtable), just for teaching purposes--#
xtable(AdjacencyMatrix2,digits = 0, type = "latex", file = "AdjacencyMatrix2.tex")

#################################

#--Next, another UNdirected network---#
AdjacencyMatrix3<-matrix(0,6,6)
AdjacencyMatrix3[1,]=c(0,1,0,0,0,0)
AdjacencyMatrix3[2,]=c(1,0,0,0,0,0)
AdjacencyMatrix3[3,]=c(0,0,0,1,0,0)
AdjacencyMatrix3[4,]=c(0,0,1,0,0,0)
AdjacencyMatrix3[5,]=c(0,0,0,0,0,1)
AdjacencyMatrix3[6,]=c(0,0,0,0,1,0)
#--Giving names to the nodes---#
rownames(AdjacencyMatrix3)<-c("A","B","C","D","E","F")
colnames(AdjacencyMatrix3)<-c("A","B","C","D","E","F")

Network3<-network(AdjacencyMatrix3,matrix.type="adjacency",directed = F)
summary(Network3)

gplot(Network3,vertex.col = 2,displaylabels = TRUE)

network.size(Network3)
gden(Network3)
components(Network3)
largest.component=component.largest(Network3,result = "graph")
geodist(largest.component)
max(geodist(largest.component)$gdist)
diameter(asIgraph(Network3))
gtrans(Network3,mode = "graph")

degree(Network3,gmode = "graph")
#--library(xtable), just for teaching purposes--#
xtable(AdjacencyMatrix3,digits = 0, type = "latex", file = "AdjacencyMatrix3.tex")




