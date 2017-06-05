###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 20/11/2016 - inicio aula: 6:25pm    v2 04/06/2017                     #
###############################################################################

# Trabalhando com Arquivos txt

# ***** Esta e a versao 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versoes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacao da versao 3.4.0 da linguagem R *****

# Configurando o diretorio de trabalho  
setwd("C:/RFundamentos/Parte_3")
getwd()

# Usando pacote readr
install.packages("readr")
library(readr)

#abre o promt para escolher o arquivo
meu_arquivo <- read.csv(file.choose())
meu_arquivo <- read.delim(file.choose(), sep = "|")

#Importando arquivos
df1 <- read_table("temperaturas.txt",
                  col_names = c ("DAY", "MONTH", "YEAR", "TEMP"))
head(df1)                  
str(df1)

read_lines("temperaturas.txt", skip = 0, n_max = -1L)                  
read_file("temperaturas.txt")

#Exportando e Importando
write_csv(iris, "iris.csv")
dir()

# col_interger():
# col_double():
# col_logical():
# col_character():
# col_factor():
# col_skip(): desconsiderar uma coluna
# col_date() (alias = âDâ), col_datetime() (alias = âTâ), col_time()(âtâ)


df_iris <- read_csv("iris.csv", col_types = list(
Sepal.Length = col_double(),
Sepal.Width = col_double(),
Petal.Length = col_double(),
Petal.Width = col_double(),
Species = col_factor(c("setosa", "versicolor", "virginica"))
))

dim(df_iris)
head(df_iris)
str(df_iris)

# Importando 
df_cad <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/cadastro.csv")
head(df_cad)

install.packages("dplyr")
library(dplyr)
options(warn = -1)

df_cad <- tbl_df(df_cad)
head(df_cad)
View(df_cad)

write.csv(df_cad, "df_cad_bkp.csv")
head(df_cad)

#Importando varios arquivos simultaneamente
list.files()
lista_arquivos <- list.files('/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap04', full.names = TRUE)
class(lista_arquivos)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read_csv)
problems(lista_arquivos2)
lista_arquivos2


# Parsing
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")


locale("en")
locale("fr")
locale("pt")

#http://www.bigmemory.org           
install.packages("bigmemory")
library(bigmemory)
?bigmemory
bigdata <- read.big.matrix(filename = "cadastro.csv" ,
                           sep = ",",
                           header = T,
                           skip = 1)







