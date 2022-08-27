#--Stock prices/volume---#

#--library(FinTS), library(quantmod), library(fpp2)---#

getSymbols("FB")
head(getSymbols("FB",auto.assign = F))
chartSeries(FB)
autoplot(dailyReturn(FB))
getSymbols("IBM")
chartSeries(IBM)
autoplot(dailyReturn(IBM))
getSymbols("GOOG")
chartSeries(GOOG)
autoplot(dailyReturn(GOOG))
getSymbols("AAPL")
chartSeries(AAPL)
autoplot(dailyReturn(AAPL))
getSymbols("TWTR")
chartSeries(TWTR)
autoplot(dailyReturn(TWTR))

ret.ap=dailyReturn(AAPL)

#########

data=Copy_of_Yahoo_Ticker_Symbols_September_2017
dim(data)
US.data=subset(data,Country=="USA")
dim(US.data)
US.ticker.symbols=US.data$Ticker
US.ticker.symbols
unique(US.data$`Category Name`)
table(US.data$`Category Name`)
sort(table(US.data$`Category Name`))

US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")]
#--library(BatchGetSymbols)---#

a=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")],
  first.date = Sys.Date() - 30,
  last.date = Sys.Date())
str(a$df.tickers)

stock.data=matrix(0,as.numeric(a$df.control[1,4]),length(US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")]))
for(i in 1:length(US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")]))
{
  stock.data[,i]=subset(a$df.tickers,ticker==US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")][i])[,6]
}
stock.data

stock.data.df<-data.frame(stock.data)
colnames(stock.data.df)<-US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")]

subset(a$df.tickers,ticker=="LUV")[,6]

###################
#--Generalising this, inviting other categories---#
###################

#---Regional Airlines--#

a1=BatchGetSymbols(
  tickers=US.data$Ticker[which(US.data$`Category Name`=="Regional Airlines")],
  first.date = Sys.Date() - 30,
  last.date = Sys.Date())

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
  first.date = Sys.Date() - 30,
  last.date = Sys.Date())

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
  first.date = Sys.Date() - 30,
  last.date = Sys.Date())

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

#---Now, let's merge them--#

stocks.info=cbind(stock.data.a1.df,stock.data.a2.df,stock.data.a3.df)
volume.info=cbind(volume.data.a1.df,volume.data.a2.df,volume.data.a3.df)
dim(stocks.info)
as.numeric(colSums(volume.info)[-c(6,34)])
#--#
t(stocks.info)
cor.dist=as.dist(1-cor(t(stocks.info)))
cor.dist2=as.dist(1-cor(stocks.info))
cor(stocks.info)

plot(seq(1,22,1),stocks.info$AAPL,"l",ylim=c(136,175))
lines(seq(1,22,1),stocks.info$ABBV,col="red")
lines(seq(1,22,1),stocks.info$KODK,col="green")
plot(stocks.info$AAPL,stocks.info$KODK,"p")
plot(stocks.info$AAPL,stocks.info$ABBV,"p")

Dist.stocks=1-cor(stocks.info)
Dist.stocks
rownames(Dist.stocks)
Dist.stocks.mod=Dist.stocks[-c(6,34),-c(6,34)]
Dist.stocks.mod
hist(as.numeric(Dist.stocks.mod))

epsilon=0.6

stock.adjacency=matrix(0,nrow(Dist.stocks.mod),ncol(Dist.stocks.mod))
for(i in 1:nrow(Dist.stocks.mod))
{
  for(j in 1:ncol(Dist.stocks.mod))
  {
    if(Dist.stocks.mod[i,j]<epsilon & Dist.stocks.mod[i,j]>0)
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
rownames(stock.adjacency)<-rownames(Dist.stocks.mod)
colnames(stock.adjacency)<-colnames(Dist.stocks.mod)

stock.adjacency.df<-as.data.frame(stock.adjacency)
rownames(stock.adjacency.df)<-rownames(Dist.stocks.mod)
colnames(stock.adjacency.df)<-colnames(Dist.stocks.mod)

#####
stock.net<-network(stock.adjacency,matrix.type="adjacency")
gplot(stock.net,displaylabels = T)

stock.graph=asIgraph(stock.net)
get.edgelist(stock.graph)

#--library(visNetwork)--#
stock.nodes<-data.frame(id=seq(1,nrow(stock.adjacency.df),1), label=rownames(stock.adjacency.df),group=c(rep("RegionalAirlines",8),rep("ElectronicEquipment",9),rep("DrugManufacturer",24)),
                        colour=c(rep("darkred",8),rep("grey",9),rep("orange",24)),size=10*as.numeric(colSums(volume.info)[-c(6,34)])/max(as.numeric(colSums(volume.info)[-c(6,34)])))
stock.edges<-data.frame(from=get.edgelist(stock.graph)[,1],to=get.edgelist(stock.graph)[,2])
visNetwork(stock.nodes,stock.edges)
