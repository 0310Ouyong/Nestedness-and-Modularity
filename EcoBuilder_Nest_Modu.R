rm(list = ls())
getwd()
setwd('C:/data')
library(vegan)  
library(bipartite)
load('EcoBuilder10nodes_matrix.RData')
EcoBuilder_Nest <- data.frame()
EcoBuilder_Modu <- data.frame()

#calculate nestedness
for(iter in 1:485){
  D = EcoBuilder_matrix[[iter]]
  EcoBuilder_Nest = rbind(EcoBuilder_Nest,
                         rbind(c('EcoBuilder',iter,as.data.frame(unname(nestednodf(D)$statistic)[3]))))
}
colnames(EcoBuilder_Nest) = c("web", "iter", "Nest")
save(EcoBuilder_Nest,file = 'EcoBuilder_Nest.RData')

#calculate modularity
for(iter in c(1:144,146:242,244:485)){
  D = EcoBuilder_matrix[[iter]]
  EcoBuilder_Modu = rbind(EcoBuilder_Modu,
                         rbind(c('EcoBuilder',iter,as.data.frame(computeModules(web = D)@likelihood))))
}
colnames(EcoBuilder_Modu) = c("web", "iter", "Modu")
save(EcoBuilder_Modu,file = 'EcoBuilder_Modu.RData')

