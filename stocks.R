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
