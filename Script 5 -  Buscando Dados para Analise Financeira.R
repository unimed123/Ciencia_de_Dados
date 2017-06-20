###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 19/06/2017 - inicio aula: 06:29 pm     dd/mm/2016 - fim aula::pm      #
###############################################################################

# Big Data na Pratica - Buscando Dados para Analise Financeira

# ***** Esta e a versao 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versoes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacao da versao 3.4.0 da linguagem R *****

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voces estao usando no seu computador
setwd("C:/RFundamentos/Parte_4")
getwd()

# http://www.quantmod.com
# Series temporais

# instalar e carregar os pacotes
install.packages("quantmod")
install.packages("xts") # Manipulacao de dados temporais
install.packages("moments") # estatisticas de dados em series temporais
library(quantmod)
library(xts)
library(moments)

# Selecao do periodo de analise
startDate = as.Date("2016-01-21")
endDate = as.Date("2016-06-21")


# Download dos dados do periodo
# Obs: o Yahoo estao desativando o servico de cotaçoes online de acoes
?getSymbols # Coleta dados de varias fontes diferente

getSymbols("PETR4.SA", src = "yahoo", from = startDate, to = endDate)


# Checando o tipo de dado retornado
class(PETR4.SA)
is.xts(PETR4.SA) # ver se e uma serie temporal

# Mostra os primeiros registros para as acoes da Petrobras
head(PETR4.SA)

# Analisandoos dados de fechamento
PETR4.SA.Close <- PETR4.SA[,"PETR4.SA.Close"] # deixou espaco vazio na linha, ou seja, vira todas as linhas
is.xts(PETR4.SA.Close)
?Cl
head(Cl(PETR4.SA.Close),5)

# Agora, vamos plotar o grafico da Petrobras
# Grafico de candlestick da Petrobras
?candleChart
candleChart(PETR4.SA)


#Plot fechamento
plot(PETR4.SA.Close, main = "Fechamento Diario Acoes Petrobras",
     col = "red", xlab = "Data", ylab = "Pregao", major.ticks = "months",
     minor.ticks = FALSE)

# Adicionado as bandas de bollinger ao grafico, com media de 20 periodos e 2 desvios
# Bollinger band
# Como o devio padrao e uma medida de volatilidade,
# Bollinger Bands ajustam-se as condicoes de mercado. Mercados mais volateis,
# possuem as bandas mais distantes da media, enquanto mercados menos volateis possuem as
# bandas mais proxima da media
?addBBands
addBBands(n = 20, sd = 2)

# Adicionando o indicador ADX, media 11 do tipo exponencial
?addADX
addADX(n = 11, maType = "EMA")

# Calculando logs diarios
?log

PETR4.SA.ret  <- diff(log(PETR4.SA.Close), lag = 1)

# Remove valores NA na posicao 1
PETR4.SA.ret <- PETR4.SA.ret [-1]

# Plotar a taxa de retorno
plot(PETR4.SA.ret, main = "Fechamento Diario das Acoes da Petrobras",
     col = "red", xlab = "Data", ylab = "Retorno", major.ticks = 'months',
         minor.ticks = FALSE)


# Calculando algumas medidas estatisticas
statNames <- c("Mean", "Standard Deviation", "Skewness", "Kurtosis")
PETR4.SA.stats <- c(mean(PETR4.SA.ret), sd(PETR4.SA.ret), skewness(PETR4.SA.ret), kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats) <- statNames
PETR4.SA.stats

# Salvando os dados em um arquivo .rds (arquivo em formato binario do R)
# getSimbols("PETR4.SA", src = 'yahoo')
saveRDS(PETR4.SA, file = "PETR4.SA.rds") # Salva os dados em formato binario
Ptr = readRDS("PETR4.SA.rds")
dir()
head(Ptr)






