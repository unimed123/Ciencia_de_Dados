install.packages ("ggplot2")
install.packages("plyr")
install.packages("swirl")
install.packages("xml")
install.packages("Rcurl")
install.packages("maptools")
install.packages("RcolorBrewer")
install.packages("ChainLadder")
install.packages("systemfit") 
install.packages("as.triangle") 
install.packages("latex2") 

library (xml) 
library(Rcurl)
library (RColorBrewer)
library(classInt)
library(ggplot2)
library(ChainLadder)
library (maptools)


setwd("M:/Restrito ao setor/atuarial/R - Project/Curso/Big data em saúde")

#Análise do Coeficiente de mortalidade Infantil (CMI)
#1000*(Número de óbitos de menores do que 1 (um) ano)/(Número de Nascidos Vivos)
#CMI: bom indicador de Saúde

#Trazer os dados de CMI dos Municipios para o R
Municipios <- read.csv("Municipios.csv",sep=";")

#Resumo dos dados
summary(Municipios)

#Histograma do CMI
hist (Municipios$CMI)

#Gráfico de dispersão para a associação entre CMI e Renda
plot (x = Municipios$renda, y = Municipios$CMI,
         main = "Gráfico de dispersão",
         xlab = "Renda",
         ylab = "CMI")

#Gráfico de dispersão com ggplot2

ggplot2(data= Municipios, aes(x=renda, y=CMI))+
          geom_point(size=0.4) +
          geom_smooth(method= "lm", color = "blue", linetype=2)+
          labs(title = "Gráfico de dispersão, Renda e CMI", x="Renda", y="CMI")

#Criar modelo de regressão entre CMI e Renda
reg <- lm(CMI ~ renda, data = Municipios)

#Resumo dos resultados de regressão 
summary(reg)

#Desconpactar Dados
unzip("estados_2010.zip")


#Guardar shapefile no objeto que chamamos de mapaUF
mapaUF <- readShapePoly("estados_2010.shp")


#Visualisar o mapa do Brasil com estados
plot (mapaUF)

#Dados inseridos no mapa
estados <- read.csv

#Dados a serem inseridos no Mapa
estados <- read.csv("estados.csv",sep=";")

#Transforma os dados CMI em uma variável categórica
estados$CMI_cat <- cut (estados$CMI, breaks=c (0,11,12,14,16,18,20), labels=c ('10','11','12 e 13','14e 15','16 e 17','18 e 19'))
                   
#Selecionamos algumas cores de uma paleta de cores do pacote RColorBrewer

paletaDeCores <- brewer.pal(9,'OrRd')
paletaDeCores <- paletaDeCores[-c(3,6,8)]


#Agora fazemos um pareamento entre as categorias do CMI e as Cores
coresDasCategorias <- data.frame(CMI_cat=levels(estados$CMI_cat),Cores=paletaDeCores)
estados <- merge(estados,coresDasCategorias)

# Guardar .dbf num objeto do R e gravar o número de linhas para reordenar a ordem dos casos
mapaData <- attr (mapaUF, 'data')
mapaData$Index = row.names(mapaData)

# Mudando o nome da variável que indica a sigla dos estados
names (mapaData) [3] = "UF"

# Fundimos então as duas tabelas
mapaData = merge(mapaData, estados, by = "UF")

# Reordenamos os dados do mapa
mapaData = mapaData[order(as.numeric(mapaData$Index)),]

# Guardamos essas informações novamente como sendo um atributo do arquivo de mapa
attr (mapaUF, 'data') = mapaData


# Configurando tela (reduzindo a margem da figura)
parDefault = par (no.readonly = T)
layout(matrix(c(1,2),nrow=2),widths=c(1,1),heigths=c(4,1))
par (mar=c(0,0,0,0))


# Plotando Mapa
plot (mapaUF, col=as.character(mapaData$Cores))
plot(1,1,pch=NA, axes=F)
legend(x='center', legend=rev(levels(estados$CMI_cat)),
       box,lty=0, fill=rev(paletaDeCores), cex=.8, ncol=2,
       title='Coeficiente de Mortalidade Infantil (2013)'
       
help(ChainLadder)
       