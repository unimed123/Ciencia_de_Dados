###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 20/11/2016 - inicio aula: 6:25pm    v2 01/06/2017                     #
###############################################################################

# Trabalhando com Arquivos txt

# ***** Esta e a versao 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versoes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacao da versao 3.4.0 da linguagem R *****


# Configurando o diretorio de trabalho
setwd("C:/RFundamentos/Parte_3")
getwd()

# Usando as funçoes base do R (pacote utils)
search()

# Importando arquico em read.table()
?read.table

df1 <- read.table("pedidos.txt")
dim(df1)

df1 <- read.table("pedidos.txt", header = T, sep = ',')

df1
dim(df1)

df1 <- read.table("pedidos.txt", header = T,
                  sep = ',',
                  col.names = c("var1", "var2", "var3" ),
                  na.strings = c('Zico', 'Maradona'))

df1

str(df1)

df1 <- read.table("pedidos.txt", header = T,
                  sep = ',',
                  col.names = c("var1", "var2", "var3" ),
                  na.strings = c('Zico','Maradona'),
                  stringsAsFactors = F)


df1

str(df1)

# Importando arquivo com read.csv()
df2 <- read.csv("pedidos.txt")
df2
dim(df2)

df3 <- read.csv2("pedidos.txt",sep = ',')
df3

df4 <- read.delim("pedidos.txt", sep = ',')
df4
dim(df4)


install.packages("data.table")
library(data.table)

BD025 <- fread("Base_Dados_Saude.txt", sep = ";", header = TRUE)
head(BD025)
dim(BD025)
dir()

list.files()

# Importando / Exportando

#Gerando arquivo
write.table(mtcars, file = 'mtcars.txt')
dir()

df_mtcars <- read.table("mtcars.txt")
df_mtcars
dim(df_mtcars)

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()
read.table("mtcars2.txt")
df_mtcars2 <- read.table("mtcars2.txt")
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|')
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|', encoding = 'UTF-8')
df_mtcars2

# Importando arquivos da internet
df_pedidos <- read.table("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/pedidos.txt", sep = ',')
df_pedidos









