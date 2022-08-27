#--library(igraph)---#
Graph <- read_graph("http://files.indicatrix.org/pandemic.graphml",
                    format = "graphml")
Graph

# Extract edgelist:
Edgelist <- get.adjacency(Graph)
# Labels:
Labels <- V(Graph)$label

# Layout:
Layout <- cbind(x = V(Graph)$x,
                y = V(Graph)$y)
# Color:
Color <- c(
  rep("blue",12),
  rep("black",12),
  rep("red",12),
  rep("yellow",12)
)

#gplot(Graph)
plot(Graph)

set_vertex_attr(Graph, "label", value = V(Graph)$label)
get.adjacency(Graph)

#,vertices=as.data.frame(Labels)#
pandemic.network=asNetwork(Graph)
gplot(pandemic.network, displaylabels = T)

E(Graph)[1]
unlist(E(Graph)[1])
pandemic.edgelist=as.data.frame(as.edgelist(pandemic.network)[1:93,])

From.Vertices=Labels[pandemic.edgelist[,1]]
To.Vertices=Labels[pandemic.edgelist[,2]]
Pandemic.links=data.frame(From.Vertices,To.Vertices)
colnames(Pandemic.links)<-c("From","To")
simpleNetwork(Pandemic.links,height="100px", width="100px",opacity = 0.9,zoom = T)
