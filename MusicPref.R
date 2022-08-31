#--library(rjson), to read the json file containing the node attributes--#
data<-fromJSON(file="HU_genres.json")
data

data$`7`

data[8]

musicEdges.df<-data.frame(musicEdges)
music.net<-network(musicEdges.df,matrix.type="edgelist")
#gplot(music.net)

str(data)

unlist(data) #--notice the side-by-side placement--#

unique(unlist(data))

data[1][1]
data[2]

which(unlist(data[1])==unique(unlist(data)))
which(unlist(data[2])==unique(unlist(data)))

as.vector(unlist(data[1])[1])
head(data)
which(as.vector(unlist(data[1]))==unique(unlist(data)))
which(as.vector(unlist(data[[2]]))==unique(unlist(data)))

which(unique(unlist(data))==intersect(as.vector(unlist(data[1])),unique(unlist(data))))
which(unique(unlist(data))==intersect(as.vector(unlist(data[2])),unique(unlist(data))))
which(unique(unlist(data))==intersect(as.vector(unlist(data[3])),unique(unlist(data))))

#--working below:--#
which(unique(unlist(data)) %in% as.vector(unlist(data[1])))
which(unique(unlist(data)) %in% as.vector(unlist(data[2])))
which(unique(unlist(data)) %in% as.vector(unlist(data[3])))
which(unique(unlist(data)) %in% as.vector(unlist(data[4])))

#--a toy example to see how "replace" works---#
x=seq(1,10,1)
y=c(5,7)
replace(x,y,0)

##
#for(i in 1:)

