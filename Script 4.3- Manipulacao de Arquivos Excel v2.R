###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 20/11/2016 - inicio aula: 6:25pm    v2 05/06/2017                     #
###############################################################################

# Maninulacao de Arquivos Excel

# ***** Esta e a versao 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versÃµes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacao da versao 3.4.0 da linguagem R ****

# Configurando o diretorio  de trabalho
setwd("C:/RFundamentos/Parte_3")
getwd()

# Instalar o Java - JDK
# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

# Windows
# Faca o download do JDK gratuitamente no site da Oracle
# Instale no seu computador
# Configure a variavel de ambiente JAVA_HOME apontantando para o diretorio de instalacaoo do JDK

# ********** Pacotes que requerem Perl **********
# E necessario instalar o interpretador da linguagem Perl
# gdata

# readxl

# Instalando os pacotes
install.packages("rJava")
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(rJava)
library(xlsx)
library(XLConnect)
library(readxl)
library(gdata)

# Obs: Ao carregar todos os pacotes que manipulam excel, pode gerar problema de namespace, pois alguns pacotes
# possuem o mesmo nome de funcoes (que saoo diferentes entre os pacotes). Para evitar problemas, carregue e use
# os pacotes de forma individual (nao carregue todos os pacotes de uma unica vez).

# Pacote readxl

# Lista as worksheet no arquivo Excel
excel_sheets("UrbanPop.xlsx")

# Lendo a planilha do Excel
read_excel("UrbanPop.xlsx")
head(read_excel("UrbanPop.xlsx"))
read_excel("UrbanPop.xlsx", sheet = "Period2")
read_excel("UrbanPop.xlsx", sheet = 3)
read_excel("UrbanPop.xlsx", sheet = 4)

# Importando uma worsheet para um dataframe
df <- read_excel("UrbanPop.xlsx", sheet = 3)
head(df)

# Importando todas as worksheets
df_todas <- lapply(excel_sheets("UrbanPop.xlsx"), read_excel, path = "UrbanPop.xlsx")
df_todas


# Pacote XLConnect
arq1 = XLConnect::loadWorkbook("UrbanPop.xlsx")
df1 = readWorksheet(arq1, sheet = "Period1", header = TRUE)
df1
class(df)


# Pacote xlsx
df2 <- read.xlsx("UrbanPop.xlsx", sheetIndex = 1)
df2

df3 <- read.xlsx2("UrbanPop.xlsx",
                  sheetIndex = 1,
                  startRow = 2,
                  colIndex = 2)
df3


df4 <- readWorksheetFromFile("UrbanPop.xlsx",
                             sheet = 1,
                             startRow = 4,
                             endCol = 2)
df4



write.xlsx(df4, "df4.xlsx", sheetName = "Data Frame")
dir()


# Pacote gdata
arq1 <- xls2csv("df4.xlsx",
                sheet = 1,
                na.strings = "EMPTY")
arq1













