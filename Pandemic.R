#--The pandemic network--#

#library(igraph) #--Basic creation and handling of "graph" objects--#
#library(network) #--Basic creation and handling of "network" objects--#
#library(intergraph) #--To switch back and forth between "graph" and "network" objects--#
#library(statnet) #--For basic network plots like gplots--#
#library(networkD3) #--To create interactive visuals--#
#library(visNetwork) #--To create interactive visuals--#
#library(networkDynamic) #--To analyse networks that evolve over time--#
#library(tsna) #--Another package to analyse networks that evolve over time--#
#library(UserNetR) #--Contains some network data sets--#

#--Let's first feed the graph in--#
Graph <- read_graph("http://files.indicatrix.org/pandemic.graphml",
                    format = "graphml")
Graph

#--Next, let's examine the edge-list:---#
Edgelist <- get.adjacency(Graph)
Edgelist
#--Labels:
Labels <- V(Graph)$label #--The V stands for vertices, and through "$", we are extracting their labels, i.e., the city names, in this case---#
Labels
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

#--A basic graph---#
#gplot(Graph)
plot(Graph)

set_vertex_attr(Graph, "label", value = V(Graph)$label)
get.adjacency(Graph)

#,vertices=as.data.frame(Labels)#
pandemic.network=asNetwork(Graph) #--converting the "igraph" structure to a "network" object--#
gplot(pandemic.network, displaylabels = T)

E(Graph)[1]
unlist(E(Graph)[1])
pandemic.edgelist=as.data.frame(as.edgelist(pandemic.network)[1:93,])

#---The five number summary for the full network---#
network.size(pandemic.network) #--the size, i.e., the number of nodes--#
gden(pandemic.network) #--the density of the network--#
is.connected(pandemic.network) #--is the thing connected? Polite inquiry on the network--#
is_connected(Graph,mode = c("strong")) #--is the thing connected? Polite inquiry on the graph--#
components(pandemic.network) #--how many "pieces" do we have--#
max(geodist(component.largest(pandemic.network,result = "graph"))$gdist)
diameter(asIgraph(pandemic.network)) #--another way to get the diameter, asIgraph (from intergraph) converts a network object to a graph object--#
diameter(Graph)
gtrans(pandemic.network,mode="graph") #--not well-defined for multigraphs--#

###--The degree distribution--####
degree(pandemic.network,gmode = "graph")
fit_power_law(degree(pandemic.network,gmode = "graph"))
hist(degree(pandemic.network,gmode = "graph"),freq = F,main = "Degree distibution, pandemic",xlab="Degree")

#--To make things interactive---#

From.Vertices=Labels[pandemic.edgelist[,1]]
To.Vertices=Labels[pandemic.edgelist[,2]]
Pandemic.links=data.frame(From.Vertices,To.Vertices)
colnames(Pandemic.links)<-c("From","To")
simpleNetwork(Pandemic.links,height="100px", width="100px",opacity = 0.9,zoom = T)
