#---library(rtweet)---#


auth_setup_default()


JamesWebbSpaceTelescope<- search_tweets("#Webb", n = 500)
Webb.net<-network_data(JamesWebbSpaceTelescope, c("retweet","mention","reply"))
Webb.net
attr(Webb.net, "idsn") #--To figure out the Twitter names of people--#
data.frame(attr(Webb.net, "idsn")$sn)
Webb.network<-network_graph(JamesWebbSpaceTelescope)
plot(Webb.network)

W.net=asNetwork(Webb.network)
gplot(W.net,displaylabels = T)

##########
get.edgelist(Webb.network)
Webb.edge.list=data.frame(get.edgelist(Webb.network)[,1],get.edgelist(Webb.network)[,2])
simpleNetwork(Webb.edge.list,height="100px", width="100px",opacity = 0.9,zoom = T)

write.csv(Webb.edge.list,"WebbEdgeList.csv") #--just freezing the results, done on August 24, 2022--#

################
Webb.net$type
Webb.edge.list.type=data.frame(get.edgelist(Webb.network)[,1],get.edgelist(Webb.network)[,2],Webb.net$type)

set.edge.attribute(Webb.network,"Type",Webb.net$type)

colrs <- c("red","blue", "green")

#--library(visNetwork)---#
visNetwork(data.frame(attr(Webb.net, "idsn")$sn),Webb.edge.list.type[,1:2])

vis.Nodes=data.frame(as.numeric(attr(Webb.net, "idsn")$id))
vis.Edges=data.frame(from=Webb.edge.list.type[,1], to=Webb.edge.list.type[,2])
visNetwork(vis.Nodes,vis.Edges)

Node.IDS=data.frame(seq(1,length(attr(Webb.net, "idsn")$id),1),attr(Webb.net, "idsn")$sn,attr(Webb.net, "idsn")$id)
which(Node.IDS[,2]==Webb.edge.list.type[,1][2])

new.from=rep(0,nrow(Webb.edge.list.type))
new.to=rep(0,nrow(Webb.edge.list.type))
for(i in 1:nrow(Webb.edge.list.type))
{
  new.from[i]=which(Node.IDS[,2]==Webb.edge.list.type[,1][i])
  new.to[i]=which(Node.IDS[,2]==Webb.edge.list.type[,2][i])
}
new.from
new.to

Webb.edge.list.type.enlarged=cbind(Webb.edge.list.type,new.from,new.to)

Twitter.nodes=data.frame(id=seq(1,length(attr(Webb.net, "idsn")$id),1),label=attr(Webb.net, "idsn")$sn)
Twitter.edges=data.frame(from=Webb.edge.list.type.enlarged[,4],to=Webb.edge.list.type.enlarged[,5],label=Webb.edge.list.type.enlarged[,3],title=Webb.edge.list.type.enlarged[,3])
visNetwork(Twitter.nodes,Twitter.edges)

write.csv(Webb.edge.list.type.enlarged,"WebbEdgeListTypeEnlarged.csv") #--just freezing the results, done on August 26, 2022--#
write.csv(Twitter.nodes,"TwitterNodes.csv")
write.csv(Twitter.edges,"TwitterEdges.csv")
################################################################

#-library(ndtv)--#
render.d3movie(W.net)
E(Webb.network)$color <- as.factor(Webb.net$type)

set.seed(1492) 

l <- layout.fruchterman.reingold(Webb.network, niter=5000, area=vcount(Webb.network)^4*10)

plot(Webb.network, layout=l, 
     edge.arrow.size=0.5, 
     vertex.label.cex=0.75, 
     vertex.label.family="Helvetica",
     vertex.label.font=2,
     vertex.shape="circle", 
     vertex.size=1, 
     vertex.label.color="black", 
     edge.width=0.5)


