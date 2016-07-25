#---- Instalando o pacote ChainLadder.---#
install.packages('ChainLadder')
library(ChainLadder)  
require(ChainLadder)

#---- Instalando o pacote gplot.---#
install.packages('gplots')
library(gplots)


#---- Escolhendo a pasta de trabalho ----#
setwd('M:/Restrito ao setor/atuarial/Provisões Técnicas/Margem de Solvência/Estudos - Subscrição de Risco')
#---- Lendo o arquivo. ----#
tri <- read.csv2('Base ou13_set14.csv', header = F)
#---- Formatando o arquivo como triângulo. ----#
tri <- as.triangle(as.matrix(tri))
tri
plot(tri,lattice=T)
#---- Formatando o triângulo tri como trinângulo incremental. ----#
tri.inc <- cum2incr(tri)
plot(tri.inc)
plot(tri.inc, lattice=T)

#---- utilizando Bootstrap chain-ladder para similuar a PEONA (Poisson)----#
B <- BootChainLadder(tri,R=10,process.dist="od.pois")
quantile(B,c(0.90,0.95))
plot(B)

#---- utilizando Bootstrap chain-ladder para similuar a PEONA (GAMA)----#
B <- BootChainLadder(tri,R=10000,process.dist="gamma")
quantile(B,c(0.90,0.95))
plot(B)

# -- APÓS SIMULAR R VEZES O IBNR SEGUNDO UMA DISTRIBUIÇÃO GAMA/Poisson, VERIFICAMOS QUE O GRÁFICO PARECE
#lOG-NORMAL?

#---- utilizando Bootstrap chain-ladder para similuar a PEONA (LOG-NORMAL)----#
library(MASS)
plot(ecdf(B$IBNR.Totals))
fit <- fitdistr(B$IBNR.Totals[B$IBNR.Totals>0], "lognormal")
fit

#-- Análise risidual, verificação se o ajustado está próxmo
curve(plnorm(x,fit$estimate["meanlog"], fit$estimate["sdlog"]), col="red", add=TRUE)
 
curve


?pnorm
?plnorm
