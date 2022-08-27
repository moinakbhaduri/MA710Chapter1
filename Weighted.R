#---library(bootnet,psych)---#

data(bfi)
results=estimateNetwork(bfi[,-c(26,27,28)],default = "EBICglasso")
plot(results)

a=bootnet(bfi[,-c(26,27,28)],nBoots = 100,default = "cor")
a
multiverse(a,labels = TRUE)

#https://cran.r-project.org/web/packages/NetworkComparisonTest/NetworkComparisonTest.pdf#
#http://sachaepskamp.com/NA2017#

#--Time varying: file:///C:/Users/moina/OneDrive/Desktop/ChangePointOnGRaphs/20140115093010001-153908.pdf--#

#--library(linkprediction)--#
proxfun(Graph,method="aa", value="edgelist")
