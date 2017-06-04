###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 20/11/2016 - inicio aula: 6:25pm    v2 01/06/2017                     #
###############################################################################

# Importando Arquivos


# ***** Esta e a versao 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versoes 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilizacaoo da versÃ£o 3.4.0 da linguagem R *****

# O R apresenta 3 pacotes principais para carga de dados a partir de arquivos texto:
#  > utils [read.table(), read.csv(), read.delim()]
#  > readr [read.delim(), read.csv(), read.tsv()]
#  > data.table

# Pacote data.table  - funcao fread() grandes base de dados


# Pacotes utils

#read.csv    Para valores separados por virgula e ponto como separador decimal
#read.csv2   Para valores separados por ponto e virgula e virgula como separador decimal
#read.delim  Para valore separados por tab e ponto como separador decimal
#read.delim2 Para valores separados por tab e virgula e virgula como separador decimal
#read.fwf    Para valores com numero exato de bytes por coluna

# data.table - generica - e aquela que representam letra, ou numeros...arquivo normal, padrao aberto conhecido por todos
# read.table("arquivo.txt" header = TRUE, sep = ",", stringAsFactors = FALSE)
# read.table("arquivo.txt" header = TRUE, sep = "\t", stringAsFactors = FALSE)

# read.csv("arquivo.csv" , stringAsFactors = FALSE)
# read.csv2("arquivo.csv" , sep = ";" , stringAsFactors = FALSE)

# read.deim("arquivo.txt") 
# read.deim2("arquivo.txt") 


# Parametros:
# > header           - tem ou não cabecalho
# > col.names        - pode passar o nome das colunas no momento da importacao
# > na.string        - define se o valor sera substituido por NA
# > colClasses       - tipo de dados que sera gerado no momento da importacao
# > sep              - caracter separador de colunas
# > stringsAsFactors - permite converter de string para fator, com isso classificar nossas variaveis categoricas


# Funcao readr - pacote novo lancado em abril/15 pelos desenvolvedores do RStudio - mais rapido porque utiliza  a linguaguem C++
# intall.packages("readr")    - parecidas com as funcoes do utils [read_table(), read_csv(), read_delim()] perceba o detalhe no underline no nome da funcao

# Manipulacao de Arquivos Excel

# Pacote XLConnect > primeira maneira de obter arquivo do excel diretamente com o R

# Ele possuem varias funcoes de acesso e manipulacao de planilha e worksheets dentro do proprio excel o unico requisito deste pacote
# e que requer o JAVA instalado.
# Trabalhando com Pacote XLConnect - loadWorbook(), getSheets(), readWorksheet(), createsheet(), writeWorksheet()

# Pacote xlsx e um dos mais poderosos  R para leitura e gravacao de planilha em excel e baseado em JAVA e funciona em todos os sistemas operacionais.
#Oferece as funcoes: read.xlsx(file, sheetIndex, header=TRUE, colClasses=NA)
#                    read.xlsx2(file, sheetIndex, header=TRUE, colClasses="character")

# O pacote readxl e outro pacote do 'Hadley Wickham' sua principal vantagem que ele nao possue dependencias
#                    read_excel()
#                    Excel_sheets()

# Outro pacote para ineteragir com o excel e o gdata
#                    read.xls()


## Atencao aos detalhes ##
#Em seus arquivos, evite espacos em branco e numeros vomo titulo para as colunas;
#Normalmente, a primeira linha de cada arquivo e o cabecalho, a lista de nomes para cada coluna;
#Para a concatenacao de palavras, use . ou _;
#Use nomes curtos como titulo de coluna;
#Evite o uso de caracteres especiais;
#Dados NA podem existir no seu conjunto de dados e isso sera tratado no processo de limpeza.

#Alem disto outras caracteristicas no seu arquivo sao importantes.
#Encoding;
#Linha de cabacalho;
#Separador de colunas;
#Quoting (aspas);
#Missing values;
#Linhas em branco;
#Espacos em branco em campos do tipo caracter;
#Comentarios

#Outros Pacotes para Importacao de Arquivos:
#Pacote rjson     - Leitura de arquivos JSON para o R;
#Pacote XML       - Leitura de arquivo xml
#Pacote httr      - Leitura de paginas html para o R;
#Pacote Rcurl     - WeB Crawling (Capitulo 5);
#Pacote foreign   - Leitura de paginas do SPSS, SAS (Capitulo 5);
#Pacote sas7bdat  - Leitura de arquivos SAS (Capitulo 5).


#  - data.table - #
#Fornece um rapido processo de carga de dados, pois as funcoes reconhecem automaticamente os parametros dos arquivos
#e decidem a melhor forma de carga

#  - fread()  - #


#Resumindo:
#Manipulacao de Arquivos txt e csv
#Package utils      - read.table(), read.csv(), read.delim()
#Package readr      - read_table(), read_csv(), read_delim()
#Package data.table - fread()

# Manipulacao de arquivos excel  - XLConnect, xlsx, readxl, gdata, r2excel.











