###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 23/06/2017 - inicio aula: 07:32 pm     dd/mm/2016 - fim aula::pm      #
###############################################################################

# Importacao de outros Softwares Estatasticos

# ***** Esta e a verso 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script paode ser executado nas versoes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacaoo da versao 3.4.0 da linguagem R *****

# Configurando o diretorio de trabalho  
# Coloque entre aspas o diretorio de trabalho que voce esta usando no seu computador

setwd("C:/RFundamentos/Parte_4")
getwd()

# instando o pacote
install.packages("haven")
library(haven) 

# SAS
vendas <- read_sas("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/vendas.sas7bdat")
?read_sas
class(vendas)
print(vendas)
str(vendas)

# Satata
df_stata <- read_dta("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/mov.dta")
class(df_stata)
str(df_stata)

# Convert values in Date column to date
df_stata$Date <- as.Date(as_factor(df_stata$Date))
str(df_stata)
plot(df_stata)

# SPSS
pessoas <- read_sav("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/pessoas.sav")
pessoas <- read.sav("pessoas.sav")
dir()

# Pacote Foreign

install.packages("foreign")
library(foreign)

florida <- read.dta("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/florida.dta")
tail(florida)
class(florida)

# SPSS
# http://cw.routledge.com/textbooks/9780415372985/resources/datasets.asp

dados <- read.spss("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/international.sav")
class(dados)
head(dados)
df <- data.frame(dados)
df
head(dados)

# Criando um boxplot
boxplot(df$gdp)

# Se voce estiver familiarizado com estatastica, voce vai ter ouvido falar de Correlacao. 
# E uma medida para avaliar a dependencia linear entre duas variaveis. 
# Ela pode variar entre -1 e 1; 
# Se proximo de 1, significa que ha uma forte associacao positiva entre as variaveis. 
# Se proximo de -1, existe uma forte associacao negativa: 
# Quando a correlacao entre duas variaveis sao 0, essas variaveis sao possivelmente independentes: 
# Ou seja, nao ha nenhuma associacao entre X e Y.

# Coeficiente de Correlacao. Indica uma associacao negativa entre GDP e alfabetizacao feminina
cor(df$gdp, df$f_illit)

# **** Importante ****
# Correlacao nao implica causalidade
# A correlacao, isto e, a ligacao entre dois eventos, nao implica 
# necessariamente uma relacao de causalidade, ou seja, que um dos 
# eventos tenha causado a ocorrencia do outro. A correlacao pode 
# no entanto indicar possiveis causas ou areas para um estudo mais 
# aprofundado, ou por outras palavras, a correlacao pode ser uma 
# pista.









