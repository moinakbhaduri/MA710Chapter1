#--Reporting on Holocaust---#

library(igraph)
library(statnet)

edges=data.frame(Holocaust$source,Holocaust$target)
edges

holocaust.network=network(edges,matrix.type="edgelist")
holocaust.network.loops=network(edges,matrix.type="edgelist",loops = T,multiple = T)
summary(holocaust.network.loops)

gplot(holocaust.network.loops,displaylabels = T)

#####################
tolerance=5
Holocaust.Subset=subset(Holocaust,Holocaust$sentences>tolerance)
dim(Holocaust.Subset)

edges.subset=data.frame(Holocaust.Subset$source,Holocaust.Subset$target)
holocaust.subset.network.loops=network(edges.subset,matrix.type="edgelist",loops = T,multiple = T)

gplot(holocaust.subset.network.loops,displaylabels = T,size=5,label.cex = 0.5)

#--For slightly better graphics---#
library(networkD3)
simpleNetwork(edges.subset,height="100px", width="100px",opacity = 0.9,zoom = T)

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
