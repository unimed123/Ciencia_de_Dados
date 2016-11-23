###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 22/11/2016 - inicio aula: 8:00 pm     dd/mm/2016 - fim aula::pm       #
###############################################################################
getwd()

# Trabalhando co arquivos csv

# Usando o pacote readr
install.packages("readr")
library(readr)

# Abre o pront para escolher o arquivo
meu_arquivo <- read_csv(file.choose())

meu_arquivo <- read_delim(file.choose(), sep = "|")


# Importando arquivos

df1 <- read_table ("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/temperaturas.txt",
                  col_names = c("DAY", "MONTH","YEAR","TEMP"))
df1

dim(df1)
str(df1)

write.table(df1, file = 'temperaturas.txt')
dir()
df2 <- read_table("temperaturas.txt")
dim(df2)
str(df2)
head(df1)
head(df2)
View(df2)

read_lines("temperaturas.txt", skip = 0, n_max = -1L)
read_file("temperaturas.txt")

# Exportando e Importando
write.csv(iris, "iris.csv")
dir()

# col_integer():
# col_double():
# col_logical():
# col_character():
# col_factor():
# col_skip():
# col_date() (alias = âDâ), col_datetime() (alias = âTâ), col_time() (âtâ)

df_iris <- read_csv ("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

dim(df_iris)
str(df_iris)
View(df_iris)

# Importando
df_cad <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/cadastro.csv")
head(df_cad)
dim(df_cad)

install.packages("dplyr")
library(dplyr)

df_cad <- tbl_df(df_cad)
head(df_cad)
View(df_cad)

write.csv(df_cad, "df_cad_bkp.csv")
dir()

# Importando varios arquivos simultaneamente
list.files()
lista_arquivos <- list.files('C:/RFundamentos/Parte 3', full.names = TRUE)
class(lista_arquivos)
lista_arquivos

# Importa todos os arquivos em uma so vez, porem tem que estar na mesma extensão.

lista_arquivos2 <- lapply(lista_arquivos, read_csv)
problems(lista_arquivos2)

# Nossa string de datas precisam estar pre-formata para convertemos no tipo data
#utilizar o parse pois se tiver qualquer erro ela identificara
# Parsing
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")
parse_date("01/02/34", "%y/%m/%d")
getwd()



read_cad <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/cadastro.csv")

write.csv(read_cad, "cadastro.csv" )
dir()

View(read_cad)

df3 <- read_table("cadastro.csv")
View(df3)
dim(df3)

dim(read_cad)
read_lines("cadastro.csv", skip = 0, n_max = -1L)


# http://www.bigmemory.org           
install.packages("bigmemory")
library(bigmemory)
?bigmemory

bigdata <- read.big.matrix(filename = "cadastro.csv",
                           sep = ",",
                           header = TRUE,
                           skip = 1)
