###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 02/05/2017 - inicio aula: 008:16 pm     dd/mm/2016 - fim aula::pm      #
###############################################################################



# dplyr
# Transformacao de Dados

install.packages("readr")
install.packages("dplyr") #e a ferramentas mais completa para manipulacao e organizacao de dados, de uma forma que agiliza o fluxo de analise e de trabalho
library(readr)
library(dplyr)

# Suprimindo mensagens de warning
searchpaths()
suppressMessages(library(dplyr))


# Carregando o dataset
df_sono <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/sono.csv")
head(df_sono)
class(df_sono)
str(df_sono)

glimpse(df_sono) #dar uma olhada, uma pequena visao
glimpse(mutate(df_sono, peso_libras = sono_total / 0.45359237)) #mutate - calcule e acrescente 1 ou + colunas

count(df_sono, cidade)
hist(df_sono$sono_total)


# Mostrar o autocomplete
?sample_n
sample_n(df_sono, size = 10)

# select() seleciona as colunas ou auxiliares
sleepData <- select(df_sono, nome, sono_total)
head(sleepData)
class(sleepData)
select(df_sono, nome)
select(df_sono, nome:cidade)


# filter() permite extrair as linhas que satisfaça determinado criterio.
filter(df_sono, sono_total >= 16)
filter(df_sono, sono_total >= 16, peso >= 80)
filter(df_sono, cidade %in% c("Recife", "Curitiba"))


# arrange() ordena as linas pelo valor de uma coluna
df_sono %>% arrange(cidade) %>% head

df_sono %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  head

df_sono %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  filter(sono_total >= 16)

df_sono %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>% 
  filter(sono_total >= 16)


# mutate() calcula e acrescenta 1 ou + linhas
head(df_sono)
df_sono %>% 
  mutate(novo_indice = sono_total / peso) %>%
  head
head(df_sono)


df_sono %>% 
  mutate(novo_indice = sono_total / peso, 
         peso_libras = peso / 0.45359237) %>%
  head


# summarize() resume os dados em uma unica linha de valor
df_sono %>% 
  summarise(media_sono = mean(sono_total))

df_sono %>% 
  summarise(media_sono = mean(sono_total), 
            min_sono = min(sono_total),
            max_ssono = max(sono_total),
            total = n())


# group_by() agrupa linhas com colunas iguais
df_sono %>% 
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total), 
            min_sono = min(sono_total), 
            max_sono = max(sono_total),
            total = n())



# Existem outras funcoes e variacoes destas funcoes [dplyr()]
# O pacote dplyr permite a realizacao de operacoes complexas
# com dataframes e matrizes utilizando apenas uma intrucao

# Pipe operator: %>%
# permite concatenar diversas funcoes em um unico comando
# explo: filter(data, variable = = numeric_value) ou
# data%>% filter variable = = numeric_value

head(select(df_sono, nome, sono_total))

df_sono %>% 

  select(nome, sono_total) %>% 
  head


df_sono %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)


df_sono


# Instalando pacote hflights (Dados de voos de Houston)
install.packages("hflights")
library(hflights)
?hflights

# Criando um objeto tbl # dataframe com algumas caracteristicas especiais - evolucao do dataframe
?tbl_df
flights <- tbl_df(hflights)
flights

# Resumindo os dados
str(hflights)
glimpse(hflights)

data.frame(head(flights))


flights[flights$Month == 1 & flights$DayofMonth == 1, ]

filter(flights, Month == 1, DayofMonth == 1)
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))
head(aggregate(ArrDelay ~ Dest, flights, mean))

flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)










