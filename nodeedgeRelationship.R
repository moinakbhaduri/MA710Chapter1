nodes=seq(2,50,1)
edges.max=seq(1,choose(50,2),1)

undirected.density=matrix(0,length(nodes),length(edges.max))
for(i in 1:length(nodes))
{
  edges=seq(1,choose(nodes[i],2),1)
  for(j in 1:length(edges))
  {
    undirected.density[i,j]=2*edges[j]/(nodes[i]*(nodes[i]-1))
  }
}

undirected.density[2,2]



library(plotly)

fig <- plot_ly(
  type = 'surface',
 # contours = list(
  #  x = list(show = TRUE, start = 1.5, end = 2, size = 0.04, color = 'white'),
   # z = list(show = TRUE, start = 0.5, end = 0.8, size = 0.05)),
  x = ~nodes,
  y = ~edges.max,
  z = ~undirected.density)

fig1<- plot_ly(
  type = 'surface',
  # contours = list(
  #  x = list(show = TRUE, start = 1.5, end = 2, size = 0.04, color = 'white'),
  # z = list(show = TRUE, start = 0.5, end = 0.8, size = 0.05)),
 # x = ~nodes,
#  y = ~edges.max,
  z = ~undirected.density)

fig2 <- plot_ly(z = ~undirected.density, type = "contour")
