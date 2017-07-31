###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 31/07/2017 - inicio aula: 06:29 pm     dd/mm/2016 - fim aula::pm      #
###############################################################################

# Big Data na Pratica - Buscando Dados para Analise Financeira

# ***** Esta e a versao 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versoes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacao da versao 3.4.0 da linguagem R *****

# Configurando o diretorio de trabalho
# Coloque entre aspas o diretorio de trabalho que voces estao usando no seu computador
setwd("C:/RFundamentos/Parte_3")
getwd()
dir()
# http://www.quantmod.com
# Series temporais

# instalar e carregar os pacotes
install.packages("quantmod") # pacote especifico para a area financeira, traz uma serie de funcoes prontas que facilita a coleta de dados financeiros a conversao desses dados para serie temporais, entre outras vantagens.
install.packages("xts") # Manipulacao de dados temporais
install.packages("moments") # uma serie de funcoes estatisticas de dados em series temporais
library(quantmod)
library(xts)
library(moments)

# Selecao do periodo de analise
startDate = as.Date("2016-01-01")
endDate = as.Date("201-07-31")


# Download dos dados do periodo
# Obs: o Yahoo estao desativando o servico de cotaçoes online de acoes
?getSymbols # Coleta dados de varias fontes diferente, permite coletar no site do google ou do yahoo, aonde tem as cotacoes das acoes

getSymbols("PETR4.SA", src = "yahoo", from = startDate, to = endDate) # src e o meu 'source'. o 'from' e 'to' poderia ser colocado direto na formula, mas utilizamos separado para otimizar o codigo.


# Checando o tipo de dado retornado
class(PETR4.SA) # retorna um objeto 'xts' sendo um objeto de series temporais (colecoes de dados gerados ao longo de um periodo)
is.xts(PETR4.SA) # ver se e uma serie temporal

# Mostra os primeiros registros para as acoes da Petrobras
head(PETR4.SA) #objeto de serie temporal, mas tambem na pratica ele e um data frame (conjunto de dados separados por linhas e colunas)

# Analisandoos dados de fechamento
PETR4.SA.Close <- PETR4.SA[,"PETR4.SA.Close"] # fazer, 'slice', nos dados que e uma serei temporal e tambem um 'data frame'. precisa passar as infos de linhas e colunas deixou espaco vazio na linha '[,"PETR4.SA.Close"]', ou seja, vira todas as linhas e apenas de uma coluna 'Close', e guardara em outro objeto chamado -> 'PETR4.SA.Close'
is.xts(PETR4.SA.Close) # e um 'xts' de serie temporal?
?Cl
head(Cl(PETR4.SA.Close),101) # outra forma de extrair as infos e utilizado a funcao 'Cl1 entre outras funcoes 'quantmod' permite extrair dados especificos de series temporais 

# uma coisa importante sobre objeto de series temporais e que o indices desses objetos sao as datas. o que cada um desses elementos sao gerados. Praticamente esta e a grande diferenca entre um objeto de serie temporal e um objeto data frame. 
# no dataframe temos os indices que tambem sao numericos, que tambem podem ser letras, strings. nos podemos decidir o indice de um obejto dataframe.
# nas series temporais o indice e exatamente a data, que e o registro quando aquele dado ocorreu

# Agora, vamos plotar o grafico da Petrobras
# Grafico de candlestick da Petrobras
?candleChart
candleChart(PETR4.SA) # tipo de grafico para mapear dados financeiros


#Plot fechamento, do pacote 'basic plot sistem' sistema basico do R
plot(PETR4.SA.Close, main = "Fechamento Diario Acoes Petrobras",
     col = "red", xlab = "Data", ylab = "Pregao", major.ticks = "days",
     minor.ticks = FALSE) # divisao por mes mas pode ser diaria/mes ou ano. 

# Adicionado as bandas de bollinger ao grafico, com media de 20 periodos e 2 desvios
# Bollinger band
# Como o devio padrao e uma medida de volatilidade,
# Bollinger Bands ajustam-se as condicoes de mercado. Mercados mais volateis,
# possuem as bandas mais distantes da media, enquanto mercados menos volateis possuem as
# bandas mais proxima da media
?addBBands
addBBands(n = 20, sd = 2) # 

# Adicionando o indicador ADX, media 11 do tipo exponencial. Adiciona o indice de movimento direcional.
?addADX
addADX(n = 11, maType = "EMA")

# Calculando logs diarios. Calcular a taxa de retorno em cima dessas acoes
?log

PETR4.SA.ret  <- diff(log(PETR4.SA.Close), lag = 1)

# Remove valores NA na posicao 1, remover os valores Note Aveleblo, esses valores podem influenciar nossa analise
PETR4.SA.ret <- PETR4.SA.ret [-1]

# Plotar a taxa de retorno, plotar sem os valores NA
plot(PETR4.SA.ret, main = "Fechamento Diario das Acoes da Petrobras",
     col = "red", xlab = "Data", ylab = "Retorno", major.ticks = 'days',
     minor.ticks = FALSE)


# Calculando algumas medidas estatisticas
statNames <- c("Mean", "Standard Deviation", "Skewness", "Kurtosis") # vetor de dados, nao calcula nada
PETR4.SA.stats <- c(mean(PETR4.SA.ret), sd(PETR4.SA.ret), skewness(PETR4.SA.ret), kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats) <- statNames
PETR4.SA.stats

# sd> quao distante e o desvio da media
# skewness> curva de frequencia da minha distribuicao
# kurtosis> diz quao precisa e minha curva de distribuicao de frequencia

# Salvando os dados em um arquivo .rds (arquivo em formato binario do R)
# getSimbols("PETR4.SA", src = 'yahoo')
saveRDS(PETR4.SA, file = "PETR4.SA.rds") # Salva os dados em formato binario
Ptr = readRDS("PETR4.SA.rds")
dir()
head(Ptr)
