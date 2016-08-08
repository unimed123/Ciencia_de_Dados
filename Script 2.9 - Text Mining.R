###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 03/08/2016 - inicio aula: 7:49pm     fim aula: 9:49pm                                 #
###############################################################################



# Text Mining

# Exemplo 1 
install.packages(c('tm', 'SnowballC', 'wordcloud','RColorBrewer'))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# carregando o dataset

df<- read.csv('C:/Users/ferna/Documents/Parte 2/questoes.csv', stringsAsFactors = FALSE)
head(df)

# Criando um corpus
dfCorpus <- Corpus(VectorSource(df$Question))
class(dfCorpus)

# Convertendo Corpus em um documento de texto plano
dfCorpus <- tm_map(dfCorpus, PlainTextDocument)

# Remove pontuacao
dfCorpus <- tm_map(dfCorpus, removePunctuation)

# Remover palavras especifica do ingles
dfCorpus <- tm_map(dfCorpus, removeWords, stopwords ('english'))

# Neste processo, varias versoes de uma palavra sao convertidas em uma unica instancia
dfCorpus <- tm_map(dfCorpus, stemDocument)

# Remove palavras especificas
dfCorpus <- tm_map(dfCorpus, removeWords, c('the', 'this', stopwords('english')))

# wordCloud
wordcloud(dfCorpus, max.words = 100, random.order = FALSE)


# Exemplo 2

install.packages("tm")  
install.package("SnowballC") 
install.packages("wordcloud") 
install.packages("RColorBrewer") 

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Lendo o arquivo
arquivo <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
texto <- readLines(arquivo)

# Carregando os dados como Corpus
docs <- Corpus (VectorSource(texto))

# Pre processamento
inspect(docs)
toSpace <- content_transformer(function (x, pattern) gsub(pattern, '', x))
docs <- tm_map(docs, toSpace, '/')
docs <- tm_map(docs, toSpace, '@')
docs <- tm_map(docs, toSpace, '\\|')

# Converte texto para minusculo
docs <- tm_map(docs, content_transformer(tolower))

# Remove Numero
docs <- tm_map(docs, removeNumbers)

# Remove palavra mais comuns do idioma ingles
docs <- tm_map(docs, removeWords, stopwords ('english'))

# Voce pode definir um vetor de palavras (stopwords) a serem removidas do texto
docs <- tm_map(docs, removeWords, c('blabla1', 'blabla2'))


# Remove pontuacao
docs <- tm_map(docs, removePunctuation)

# Remove espacos extras
docs <- tm_map(docs, stripWhitespace)

# Text Stemmining
docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)
head(d, 10)






