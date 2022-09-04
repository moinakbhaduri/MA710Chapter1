#--library(rjson), to read the json file containing the node attributes--#
#data<-fromJSON(file="HU_genres.json")
data<-fromJSON(file="RO_genres.json")
data

data$`7`

data[8]

musicEdges.df<-data.frame(MusicPrefEdges)
music.net<-network(musicEdges.df,matrix.type="edgelist")
#gplot(music.net)

str(data)

unlist(data) #--notice the side-by-side placement--#

unique(unlist(data))

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

#---for loops take a long time, so we've saved the matrix---#
#pref.matrix=matrix(0,41773,length(unique(unlist(data))))
#for(i in 1:41773)
#{
#  pr=which(unique(unlist(data)) %in% as.vector(unlist(data[i])))
#  initial.pr=rep(0,length(unique(unlist(data))))
#  pref.matrix[i,]=replace(initial.pr,pr,1/length(pr))
#  
#}
#pref.matrix

#write.csv(pref.matrix,"Pref.Matrix.csv")
