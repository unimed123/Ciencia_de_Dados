#---- Instalando o pacote ChainLadder.---#
install.packages('ChainLadder')
library(ChainLadder)  
require(ChainLadder)

#---- Instalando o pacote gplot.---#
install.packages('gplots')
library(gplots)


#---- Escolhendo a pasta de trabalho ----#
setwd('M:/Restrito ao setor/atuarial/Provis�es T�cnicas/Margem de Solv�ncia/Estudos - Subscri��o de Risco')
#---- Lendo o arquivo. ----#
tri <- read.csv2('Base ou13_set14.csv', header = F)
#---- Formatando o arquivo como tri�ngulo. ----#
tri <- as.triangle(as.matrix(tri))
tri
plot(tri,lattice=T)
#---- Formatando o tri�ngulo tri como trin�ngulo incremental. ----#
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

# -- AP�S SIMULAR R VEZES O IBNR SEGUNDO UMA DISTRIBUI��O GAMA/Poisson, VERIFICAMOS QUE O GR�FICO PARECE
#lOG-NORMAL?

#---- utilizando Bootstrap chain-ladder para similuar a PEONA (LOG-NORMAL)----#
library(MASS)
plot(ecdf(B$IBNR.Totals))
fit <- fitdistr(B$IBNR.Totals[B$IBNR.Totals>0], "lognormal")
fit

#-- An�lise risidual, verifica��o se o ajustado est� pr�xmo
curve(plnorm(x,fit$estimate["meanlog"], fit$estimate["sdlog"]), col="red", add=TRUE)
 
curve


?pnorm
?plnorm
