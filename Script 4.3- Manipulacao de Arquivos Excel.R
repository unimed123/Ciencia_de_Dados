###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 25/11/2016 - inicio aula: 7:08 pm     dd/mm/2016 - fim aula::pm       #
###############################################################################

# Manipulacao de arquivos Excel

# Instalar o Java - JRE
# http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html

Sys.setenv(JAVA_HOME = '/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/jre')
Sys.getenv("JAVA_HOME")
system("java -version")
options(java.home = "/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/jre")

# Mac e Linux
# sudo R CMD javareconf
# sudo ln -f -s $(/usr/libexec/java_home)/jre/lib/server/libjvm.dylib /usr/local/lib

# Requer Java
# XlConnect
# xlsx
# rJava

# Requer Perl
# gdata

# readxl >>pacote rapido e novo nao esta totalmente pronto ate o momento<<

install.packages("rJava", type = "source") #quando executa o comando neste formato o pacote e recopilado de acordo com o seu sistema
                                           #operacional, a vantagem disto e que ele e preparado para trabalhar direto com a sua versao original
                                           #Opcao interessante, neste caso precisamos faze-lo ao utilizarmos o rJava.
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(readxl)
library(rJava)
library(xlsx)
library(XLConnect)
library(gdata)

install.packages("rJava", type = "source")
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(readxl)
library(rJava)
library(xlsx)
library(XLConnect)
library(gdata)

# Pacote readxl

# Lista as worksheet no arquivo Excel

excel_sheets("UrbanPop.xlsx")

# Lendo a planilha do Excel
read_excel("UrbanPop.xlsx")
head(read_excel("UrbanPop.xlsx"))
read_excel("UrbanPop.xlsx",sheet = "Period2")
read_excel("UrbanPop.xlsx",sheet = 3)
read_excel("UrbanPop.xlsx", sheet = 4)

# Importando uma worksheet para um dataframe
df <- read_excel("UrbanPop.xlsx", sheet = 3)
head(df)
dim(df)

# Importando todas as worksheets
df_todas <- lapply(excel_sheets("UrbanPop.xlsx"), read_excel, path = "UrbanPop.xlsx")
df_todas
class(df_todas)

# Pacote XLConnect /nao consegui rodar, possivel problema no pacote rJava
arq1 = loadWorkbook("UrbanPop.xlsx")
df1 = readWorksheet(arq1, sheet = "Period1", header = TRUE)
df1
class(df)

# Pacote xlsx /nao consegui rodar, possivel problema no pacote rJava
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


















