###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 14/12/2016 - inicio aula: 07:41 pm     19/12/2016 - fim aula::pm      #
###############################################################################

# objetivo deste modulo e mostra de uma forma mais avancada a relacao entre um BD
# na aula anterior, aprendemos como trabalhar com arquivo conectar em um banco relacional o SQLite
# como ler uma tabela, como ler uma tabela, como carregar um arquivo para dentro de uma tabela  e depois
# consultar esses dados usando a linguagem SQL, neste modulo iremos tambem coletar dados de uma tabela mas
# tambem faremos algumas manipulacoes e vamos gerar alguns graficos, vamos utilizar o mesmo BD que utilizamos
# nas aulas de linguagem SQL (github:Ciencia_de_Dados/Script 4 .4 - Linguagem SQL.txt)


# MySQL


install.packages("RMySQL") # começar estalando o pacote, temos pacote para cada sistema gerenciador de BD
install.packages("ggplot2")
install.packages("dplyr")
library(RMySQL)
library(ggplot2)
library(dplyr)

# Conexao com o banco de dados # perceba que e o mesmo procedimento do SQLite, o mesmo se aplica ao ORACLE, SQL, a ideia e praticamente a mesma, so que cada BD implementa a conexao de uma maneira diferente
con = dbConnect(MySQL(), user = "fernando", password = "unimed123", dbname = "titanicDB", host = "localhost")

# Query # cria um objeto (qry) e colocar dentro a mesma query do sql (MySQL 5.7.13)
qry <- "select pclass, survived, avg(age) as media_idade from titanic where survived = 1 group by pclass, survived;"
dbGetQuery(con, qry) # execucao da query dentro do SQL usando o R.  con (conexao) qry (query)

# Plotar
dados <- dbGetQuery(con, qry) # agora vai gravar o conjunto de dados em uma dataframe
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")

# Conectando no MySQL com dplyr # vamos fazer a mesma coisa, porem utilizando o dplyr, pacote mais poderoso para trabalhar com manipulacao de dados
con2 <- src_mysql(dbname = "titanicDB", user = "fernando", password = "unimed123", host = "localhost") # src_mysql funcao que serve para conectar direto ao BD, grava isto dentro de uma conexao (con2)

dados2 <- con2 %>% # tem o objeto >dados2< vai colocar dentro do dataframe a minha conexao >con2< vai concatenar (operador de concatenar %>%)
  tbl("titanic") %>% # vamos concatenar com a conexao >con2<
  select(pclass, sex, age, survived, fare) %>% # vamos fazer um select no conjunto de dados
  filter(survived == 0) %>% # vai filtrar um conjunto de dados, so quando a coluna for igual a "0"
  collect() # apos dar um collect, que e buscar aqueles dados

# o dplyr e uma forma de implementar a linguagem SQL atraves de funcoes, ao inves de usar SQL utilizaremos funcoes propria do pacote,que sao muita mais rapidas e que nos darao muitas opcoes de configuracao e customizacao,

head(dados2)

# Manipulando dados # faremos o mesmo processo anterior
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>% # mesmo processo, apenas estaremos incluindo o group_by
  summarise(survival_ratio = mean(survived)) %>% #tambem iremos sumarizar os dados, atraves da media de um dos campos
  collect() 
# cada uma dessas funcoes e um comando que estamos concatenando com o operador de concatenacao (%>%)

ggplot(dados2, aes(pclass,survival_ratio, color=sex, group=sex)) +
  geom_point(size=3) + geom_line()
# esse processo tem que precisamos comecar a habituar, conecta no banco, coleta seus dados, faz uma primeira manipulacao, joga isso no plot  ve como seus dados estao organizados, volta continua a limpeza ate termos um conjunto de dados realmente limpo e organizado de forma consistente para avancarmos para machinelearning 

# Sumarizando os dados
dados2 <- con2 %>%
  tbl("titanic") %>% 
  filter(fare > 150) %>%
  select(pclass,sex,age,fare) %>%
  group_by(pclass,sex) %>% 
  summarise(avg_age = mean(age),
            avg_fare = mean(fare)) # o mesmo processo, porem a media aplicada em dois campos, (age e fare) >fare e o preco pago<

head(dados2)

# esse pequeno conjunto de dados, pode ser resultado de um dataset de milhoes de linhas


# --> Para outros bancos de dados, use RODBC # mas podemos utilizar os pacotes que ja tem as funcoes, podemos usar o dplyr e conectarmos direto a um banco de dados. 






