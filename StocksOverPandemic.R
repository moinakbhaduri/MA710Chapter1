

###################
#--Generalising this, inviting other categories---#
###################

#---Regional Airlines--#

a1=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")],
  first.date =  "2019-07-01",
  last.date = "2022-07-01")

stock.data.a1=matrix(0,as.numeric(a1$df.control[1,4]),length(as.vector(a1$df.control[,1]$ticker)))
volume.data.a1=matrix(0,as.numeric(a1$df.control[1,4]),length(as.vector(a1$df.control[,1]$ticker)))
for(i in 1:length(as.vector(a1$df.control[,1]$ticker)))
{
  stock.data.a1[,i]=subset(a1$df.tickers,ticker==as.vector(a1$df.control[i,1]))[,6]
  volume.data.a1[,i]=subset(a1$df.tickers,ticker==as.vector(a1$df.control[i,1]))[,5]
}
stock.data.a1
volume.data.a1

stock.data.a1.df<-data.frame(stock.data.a1)
volume.data.a1.df<-data.frame(volume.data.a1)

colnames(stock.data.a1.df)<-a1$df.control[,1]$ticker
colnames(volume.data.a1.df)<-a1$df.control[,1]$ticker

stock.data.a1.df
volume.data.a1.df

#--Electronic equipment--#

a2=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Electronic Equipment")],
  first.date = "2019-07-01",
  last.date = "2022-07-01")

stock.data.a2=matrix(0,as.numeric(a2$df.control[1,4]),length(as.vector(a2$df.control[,1]$ticker)))
volume.data.a2=matrix(0,as.numeric(a2$df.control[1,4]),length(as.vector(a2$df.control[,1]$ticker)))
for(i in 1:length(as.vector(a2$df.control[,1]$ticker)))
{
  stock.data.a2[,i]=subset(a2$df.tickers,ticker==as.vector(a2$df.control[i,1]))[,6]
  volume.data.a2[,i]=subset(a2$df.tickers,ticker==as.vector(a2$df.control[i,1]))[,5]
}
stock.data.a2
volume.data.a2

stock.data.a2.df<-data.frame(stock.data.a2)
volume.data.a2.df<-data.frame(volume.data.a2)

colnames(stock.data.a2.df)<-a2$df.control[,1]$ticker
colnames(volume.data.a2.df)<-a2$df.control[,1]$ticker

stock.data.a2.df
volume.data.a2.df

##################

#--Drug Manufacturers - Major--#

a3=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Drug Manufacturers - Major")],
  first.date = "2019-07-01",
  last.date = "2022-07-01")

stock.data.a3=matrix(0,as.numeric(a3$df.control[1,4]),length(as.vector(a3$df.control[,1]$ticker)))
volume.data.a3=matrix(0,as.numeric(a3$df.control[1,4]),length(as.vector(a3$df.control[,1]$ticker)))
for(i in 1:length(as.vector(a3$df.control[,1]$ticker)))
{
  stock.data.a3[,i]=subset(a3$df.tickers,ticker==as.vector(a3$df.control[i,1]))[,6]
  volume.data.a3[,i]=subset(a3$df.tickers,ticker==as.vector(a3$df.control[i,1]))[,5]
}
stock.data.a3
volume.data.a3

stock.data.a3.df<-data.frame(stock.data.a3)
volume.data.a3.df<-data.frame(volume.data.a3)

colnames(stock.data.a3.df)<-a3$df.control[,1]$ticker
colnames(volume.data.a3.df)<-a3$df.control[,1]$ticker

stock.data.a3.df
volume.data.a3.df

#--Communication Equipment--#

a4=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Communication Equipment")],
  first.date = "2019-07-02",
  last.date = "2022-07-01")

stock.data.a4=matrix(0,as.numeric(a4$df.control[1,4]),length(as.vector(a4$df.control[,1]$ticker)))
volume.data.a4=matrix(0,as.numeric(a4$df.control[1,4]),length(as.vector(a4$df.control[,1]$ticker)))
for(i in 1:length(as.vector(a4$df.control[,1]$ticker)))
{
  stock.data.a4[,i]=subset(a4$df.tickers,ticker==as.vector(a4$df.control[i,1]))[,6]
  volume.data.a4[,i]=subset(a4$df.tickers,ticker==as.vector(a4$df.control[i,1]))[,5]
}
stock.data.a4
volume.data.a4

stock.data.a4.df<-data.frame(stock.data.a4)
volume.data.a4.df<-data.frame(volume.data.a4)

colnames(stock.data.a4.df)<-a4$df.control[,1]$ticker
colnames(volume.data.a4.df)<-a4$df.control[,1]$ticker

stock.data.a4.df
volume.data.a4.df

#--Major Airlines--#

a5=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Major Airlines")],
  first.date = "2019-07-02",
  last.date = "2022-07-01")

stock.data.a5=matrix(0,as.numeric(a5$df.control[1,4]),length(as.vector(a5$df.control[,1]$ticker)))
volume.data.a5=matrix(0,as.numeric(a5$df.control[1,4]),length(as.vector(a5$df.control[,1]$ticker)))
for(i in 1:length(as.vector(a5$df.control[,1]$ticker)))
{
  stock.data.a5[,i]=subset(a5$df.tickers,ticker==as.vector(a5$df.control[i,1]))[,6]
  volume.data.a5[,i]=subset(a5$df.tickers,ticker==as.vector(a5$df.control[i,1]))[,5]
}
stock.data.a5
volume.data.a5

stock.data.a5.df<-data.frame(stock.data.a5)
volume.data.a5.df<-data.frame(volume.data.a5)

colnames(stock.data.a5.df)<-a5$df.control[,1]$ticker
colnames(volume.data.a5.df)<-a5$df.control[,1]$ticker

stock.data.a5.df
volume.data.a5.df

#--Restaurants--#

a6=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Restaurants")],
  first.date = "2019-07-02",
  last.date = "2022-07-01")

stock.data.a6=matrix(0,as.numeric(a6$df.control[1,4]),length(as.vector(a6$df.control[,1]$ticker)))
volume.data.a6=matrix(0,as.numeric(a6$df.control[1,4]),length(as.vector(a6$df.control[,1]$ticker)))
for(i in 1:length(as.vector(a6$df.control[,1]$ticker)))
{
  stock.data.a6[,i]=subset(a6$df.tickers,ticker==as.vector(a6$df.control[i,1]))[,6]
  volume.data.a6[,i]=subset(a6$df.tickers,ticker==as.vector(a6$df.control[i,1]))[,5]
}
stock.data.a6
volume.data.a6

stock.data.a6.df<-data.frame(stock.data.a6)
volume.data.a6.df<-data.frame(volume.data.a6)

colnames(stock.data.a6.df)<-a6$df.control[,1]$ticker
colnames(volume.data.a6.df)<-a6$df.control[,1]$ticker

stock.data.a6.df
volume.data.a6.df


#---Now, let's merge them--#
dim(stock.data.a1.df)
dim(stock.data.a2.df)
dim(stock.data.a3.df)
dim(stock.data.a4.df)
dim(stock.data.a5.df)
dim(stock.data.a6.df)

stocks.info=cbind(stock.data.a1.df[,1:9],stock.data.a2.df[,1:9],stock.data.a3.df[,1:4],stock.data.a4.df[,1:6],stock.data.a5.df[,1:7],stock.data.a6.df$ARCO)
dim(stocks.info)
volume.info=cbind(volume.data.a1.df[,1:9],volume.data.a2.df[,1:9],volume.data.a3.df[,1:4],volume.data.a4.df[,1:6],volume.data.a5.df[,1:7],volume.data.a6.df$ARCO)
dim(volume.info)

#--Just freezing the data--#
#--write.csv(stocks.info,"PandemicStocksInfo.csv")
#--write.csv(volume.info,"PandemicVolumeInfo.csv")

########
#-------The "mining" stage ends here; the analysis begins next---#
########

#--Link formation deal: A is B's friend if they are similar in terms of movement patterns--#
#--even if they are dissimilar in terms of size (A may be a big company, B may be a smaller one)---#
#--so let's choose the correlation distance, not the Euclidean---#

Dist.stocks=1-cor(stocks.info)
Dist.stocks

hist(as.numeric(Dist.stocks))

#--creating the adjacency matrix--#

epsilon=0.6

stock.adjacency=matrix(0,nrow(Dist.stocks),ncol(Dist.stocks))
for(i in 1:nrow(Dist.stocks))
{
  for(j in 1:ncol(Dist.stocks))
  {
    if(Dist.stocks[i,j]<epsilon & Dist.stocks[i,j]>0)
    {
      stock.adjacency[i,j]=1
    }
    else
    {
      stock.adjacency[i,j]=0
    }
  }
}
stock.adjacency
rownames(stock.adjacency)<-rownames(Dist.stocks)
colnames(stock.adjacency)<-colnames(Dist.stocks)

stock.adjacency.df<-as.data.frame(stock.adjacency)
rownames(stock.adjacency.df)<-rownames(Dist.stocks)
colnames(stock.adjacency.df)<-colnames(Dist.stocks)

#####
stock.net<-network(stock.adjacency,matrix.type="adjacency")
gplot(stock.net,displaylabels = T)

stock.graph=asIgraph(stock.net)
get.edgelist(stock.graph)

#--library(visNetwork)--#
stock.nodes<-data.frame(id=seq(1,nrow(stock.adjacency.df),1), label=rownames(stock.adjacency.df),group=c(rep("RegionalAirlines",9),rep("ElectronicEquipment",9),rep("DrugManufacturer",4),
                                                                                                         rep("CommunicationEquipment",6),rep("MajorAirlines",7),rep("Restaurants",1)),
                        colour=c(rep("darkred",9),rep("grey",9),rep("orange",4),rep("blue",6),rep("green",7),rep("cyan",1)),size=10*as.numeric(colSums(volume.info)/max(as.numeric(colSums(volume.info)))))
stock.edges<-data.frame(from=get.edgelist(stock.graph)[,1],to=get.edgelist(stock.graph)[,2])
visNetwork(stock.nodes,stock.edges)

# 
visNetwork(stock.nodes, stock.edges) %>% 
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)

# or add a selection on another column
visNetwork(stock.nodes, stock.edges) %>% 
  visOptions(selectedBy = "group")
