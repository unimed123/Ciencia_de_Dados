###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 18/09/2017 - inicio aula: 13:00 pm   20/09/2017 - fim aula: 13:41pm   #
###############################################################################



# Web Scraping

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("M:/Restrito ao setor/atuarial/R/Fernando")
getwd()
dir()

# Pacotes R para Web Scraping
# RCurl
# httr
# XML
# rvest

# Pacote rvest - útil para quem não conhece HTML e CSS
install.packages('rvest')
Sys.getenv("R_LIBS_USER")
library(rvest, local("C:\\Users\\fcarvalho\\AppData\\Local\\Temp\\RtmpwTw3ON\\downloaded_packages"))




# Coletando a url do filme: 13 Horas - Os Soldados Ocultos de Benghazi
?read_html
filme <- read_html("http://www.imdb.com/title/tt4172430/")
class(filme)
head(filme)

# Coletando a classificação do filme
?html_node
?html_text

filme %>% 
  html_node("strong span") %>%
  html_text() %>%
  as.numeric()

# Coletando o elenco do filme
filme %>%
  html_nodes("#titleCast .itemprop span") %>%
  html_text()

# Gravando em formato tablea
filme %>%
  html_nodes("table") %>%
  .[[3]] %>%
  html_table()


# Coletando a previsão metereológica
pagina <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")
previsao <- html_nodes(pagina, "#detailed-forecast-body b , .forecast-text")
texto <- html_text(previsao)
paste(texto, collapse = " ")


# Formatando os dados de uma página web
library(rvest)
library(stringr)
library(tidyr)


## coletar manipular e alterar os dados e gravar isto em um arquivo de saida
## veremos os principais campeaes do superbowl
# Extraindo a página web
url <- 'http://espn.go.com/nfl/superbowl/history/winners' # capturar a pagina dentro de um objeto que chamamos de url
pagina <- read_html(url) # ler o objeto e jogar dentro de uma pagina


## Vamos comecar os trabalho de manipiulacao dos dados
# Extraindo a tag "table" do código HTML e convertendo para dataframe
tabela <- html_nodes(pagina, 'table') ## primeira parte vamos coletar tudo que estiver na tag 'table'
## se conhece um pouco de html ja sabe se quer criar uma tabela dentro de uma pagina html voce usa a tag 'table'
## tudo que estiver em 'table' tem um formato de tabela, voce consegue extrair a inf como estivesse extraindo uma tabela.
class(tabela)
tab <- html_table(tabela)[[1]] ## vamos extair deste aquivo o conteudo html
class(tab)
head(tab) ## transformamos o objeto em html 'table'

# Removend as duas primeiras linhas e adicionando nomes as colunas
tab <- tab[-(1:2), ] ## remover as linhas 
head(tab)
names(tab) <- c("number", "date", "site", "result") ## colocar nomes para as colunas
head(tab)

# Convertendo de algarismos romanos para números inteiros
tab$number <- 1:51 ## converter os numeros romanos para numeros inteiros
tab$date <- as.Date(tab$date, "%B. %d, %Y") ## transformou a coluna data
head(tab)

# Dividindo as colunas em 4 colunas
## utilizamos a funcao 'seprate' do 'tydyr', separar a coluna 'result' em duas outras colunas, passando o dataframe tab
tab <- separate(tab, result, c('winner', 'loser'), sep = ', ', remove = TRUE)
head(tab)

## agora faremos outra trasnformacao fazendo as expressoes regulares
pattern <- " \\d+$" ## criaremos um padrao que ira buscar por digito
## vou extrair este digitos com a funcao 'str_extract', explo dento de winner ira buscar o padrao que acabamos de criar " \\d+$"
tab$winnerScore <- as.numeric(str_extract(tab$winner, pattern)) 
tab$loserScore <- as.numeric(str_extract(tab$loser, pattern))
tab$winner <- gsub(pattern, "", tab$winner) ## ira substituir, aonde encontrar o padrao ira substituir por zero
tab$loser <- gsub(pattern, "", tab$loser)
head(tab)

# Grava o resultado no arquivo csv
write.csv(tab, 'superbowl.csv', row.names = F) ## no final, salvaremos o novo arquivo manipulado em .csv
dir()




# https://www.import.io
# http://scrapinghub.com
  