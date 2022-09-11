#---library(bootnet,psych,qgraph)---#

data(bfi)

#---Let's focus only on the 5 major types of questions, i.e., the first 25 columns---#
modified.data=bfi[,-c(26,27,28)]

#---Let's create a partial correlation type matrix (but for likert-scale, ordinal type data)---#
c.matrix = cor_auto(modified.data)

#---Cool! So where's the network that uses this matrix to develop edges?---#
qgraph(c.matrix, graph = "pcor", layout = "spring", cut = 0)

#---In case we want to go straight to the network from the data (i.e., without actually seeing the correlation numbers)--#
Trait.network = estimateNetwork(modified.data, default = "pcor")
plot(Trait.network, layout = "spring", cut = 0)

#---Let's peel out the pieces---#
Trait.network$graph

#--Just polishing my graph, adding legends, etc.---#
Questions = scan("http://sachaepskamp.com/files/BFIitems.txt",
              what = "character", sep = "\n") #--to show the actual questions---#

Traits = rep(c('Agreeableness','Conscientiousness','Extraversion','Neuroticism','Opennness'),each=5)

plot(Trait.network,
     layout = "spring",
     cut = 0,
     groups = Traits,
     nodeNames = Questions,
     legend.cex = 0.4)

centrality(Trait.network)
centralityPlot(Trait.network)
############################################

Train.network.lasso=estimateNetwork(modified.data,default = "EBICglasso")
plot(Train.network.lasso,
     layout = "spring",
     cut = 0,
     groups = Traits,
     nodeNames = Questions,
     legend.cex = 0.4)

centralityPlot(Train.network.lasso)

a=bootnet(bfi[,-c(26,27,28)],nBoots = 100,default = "cor")
a
multiverse(a,labels = TRUE)

#https://cran.r-project.org/web/packages/NetworkComparisonTest/NetworkComparisonTest.pdf#
#http://sachaepskamp.com/NA2017#

#--Time varying: file:///C:/Users/moina/OneDrive/Desktop/ChangePointOnGRaphs/20140115093010001-153908.pdf--#

#--library(linkprediction)--#
proxfun(Graph,method="aa", value="edgelist")
