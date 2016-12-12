###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 10/12/2016 - inicio aula: 09:28 am     dd/mm/2016 - fim aula::pm      #
###############################################################################

# Banco de Dados

# Utilizando SQLite

# Versao simplificada de um SGBD, o SQLite nao possue muitas caracteristicas 
# de grandes SGBD como Oracle e o SQLService, porque o objetivo do SQLite e ser
# leve e simples para que possa ser utilizado em dispositivos moveis Smartfone
# tablets todos esles utilizam SQLite internamente no sistema operacional do dis_
# positivo para gravar informacoes, segundo as ultimas pesquisas o SQLite mostrou
# como o uso de banco de dados relacionais mais utilizados no mundo, so que em dis_
# positivos moveis, portanto aprender o SQLite e a forma de conhecer como funciona 
# melhor armazenamento de dados em Mobile, dispositivos moveis.
# Uma das principais vantagens do SQLite e que todo o seu conjunto de dados as 
# tabelas ficam armazenadas em um unico arquivo (arquivo.db), esse arquivo pode ser
# enviado por e-mail, compartilhado em seu repositorio, gravar em uma outra maquina
# voce pode fazer backup (em um pen drive inclusive) e porque cientista de dados uti_
# lizam o SQLite, tem sido cada vez mais comum, ao inves de importar um arquivo texto 
# direto para o R, voce importa o arquivo para o banco de dados, depois utilizar o R
# para consultar o banco de dados, entao trazer os registros para o seu ambiente mani_
# pula-los e depois grava-lo em um novo banco de dados SQLite.
# A grande vantagem o SQLite e bastante leve, segundo voce pode gravar todo seu traba_
# lho em um unico arquivo.db e guardar esse arquivo em um pendrive/ou hd externo, pode 
# compartilhar o arquivo com outros profissionais poderam utilizar o SQLite para visua_
# lizar o conteudo do arquivo. Uma pratica mais comum e utilizar um banco relacional ao
# inves de arquivo.txt.

# Instalar o SQLite
install.packages("RSQLite")
library(RSQLite)

# Remover o banco SQLite, caso exista - Nao obrigatorio
# system ("del exemplo.db")
system("rm exemplo.db")

# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db") # se o banco de dados nao exitir o SQLite cria neste momento
dbListTables(con)

# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(con, "mtcars", mtcars)

# Listando uma tabela
dbListTables(con) # confirmar que a tabela existe
dbExistsTable(con,"mtcars") # para verificar se a tabela existe
dbExistsTable(con, "mtcars2")
dbListFields(con, "mtcars") # listar as colunas da tabela

# Lendo o conteudo da tabela
dbReadTable(con, "mtcars") # ler o conteudo da tabela, como se fosse uma funcao select da linguagem SQL

# Criando apenas a definicao de tabela
dbWriteTable(con, "mtcars2", mtcars [0,]) # criar uma tabela vazia [0,], criar a sua estrutura e depois alimentar a tabela
dbListTables(con)
dbReadTable(con, "mtcars2")

# Executando consultas no banco de dados
query = "select row_names from mtcars" # pode tb realizar consultas SQL direto da minha tabela
rs = dbSendQuery(con, query) # enviar a query ao BD, gravar no objeto rs. Nesse momento tem a query enviada
dados = fetch(rs, n = -1) # imprimir os resultados da query, para isto usa o fetch()
dados
class(dados)

# geramos um dataframe e gravamos dentro de uma tabela. Mas veremos a seguir fazer isto dentro de um arquivo
# recebe o arquivo texto, gravar no BD, depois ir coletando pedaços dessa tabela e gravando em diferentes dataframe
# forma interessante de trabalhar e trazer pequenos subsets para dentro do R e fazer seu trabalho de analise, pequisa,
# consolidação dos dados.

# Executando consultas no banco de dados
query = "select row_names from mtcars" # criou a query
rs = dbSendQuery(con, query) # seu result set
while (!dbHasCompleted(rs)) # ao inves de usar a funcao fetch() usou um loop while
{
  dados = fetch(rs, n = 1)
  print(dados$row_names)
} # forma interessante de vazer uma verificacao, antes de retornar os dados
  # pode ir importando os dados da sua tabela de BD relacional e ja ir fazendo transformacoes
  # a medida que vai coletando os dados 

# Executando consultas no banco de dados
query = "select disp, hp from mtcars where disp > 160" # zerar mais uma query mas com uma condicao utilizando a clausula "where" retornar dados apenas onde a coluna forma maior que 160
rs = dbSendQuery(con, query) # guarda isso no seu objeto Result Set
dados = fetch(rs, n = -1) # gera o meu fetch ()
dados # temo o dataframe que agora e um outro subset da minha tabela do BD

# Executando consultas no banco de dados
query = "select row_names, avg(hp) from mtcars group by row_names" # pode ainda fazer um agrupamento, ja traz  a media de uma determinada coluna antes mesmo dos dados entrarem no R, coletando os dados em tempo de execucao ja vai calculando a media.
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

# Pode-se usar o SQL em processos de analise, o SQL e usado para voce trazer os dados para o R e nesse processo de coleta
# podemos realizar transformacoes que a linguagem SQL permite 

# Criando uma tabela a partir de um arquivo
dbWriteTable(con, "tempo", "tempo.txt", sep = ",", header = T) # criar a tabela tempo a partir do aquivo "tempo.txt", arquivo deve estar no repositorio
dbListTables(con)
dbReadTable(con, "tempo")

# aquivo gravado direto, sem limpeza, caracter NA, se seu arquivo nao esta devidadmente formatado
# a importacao do BD, bom conhecer como esta seu arquivo antes de importa-lo no BD, nada impede que a partir de visualizar, voce trate os dados

getwd()

# Encerrando a conexao
dbDisconnect(con) # no momento que encerrar a operacao, lembre-se, desconecte do banco de dados


# tudo apresentado e completamente o mesmo processo para outro banco correlacionado
# o que muda e uma ou outra funcao e o pacote que voce utiliza


# Carregando dados no banco de dados
# http://dados.gov.br/dataset/indice-nacional-de-precos-ao-consumidor-amplo-15-ipca-15
# Criando driver e conexao ao banco de dados
drv = dbDriver("SQLite") # como encerrou a conexao precisa novamente criar o dbDriver
con = dbConnect(drv, dbname = "exemplo.db") # fazer a conexao com o BD

dbWriteTable(con,"indices","indice.csv",
             sep = "|", header = T) # carregar o arquivo na sua tabela indice

getwd() # antes ver aonde esta gravado seu diretorio

dbRemoveTable(con, "indices") # se cometeu algum erro na instrucao, pode simplimente remover a tabela dbRemove()

dbWriteTable(con,"indices","indice.csv",
             sep = "|", header = T) # pode recria-la agora, uma vez que tenha corrigido o arquivo, etc.

dbListTables(con) # verificar quais tabelas tem gravada

dbReadTable(con,"indices") # ler a tabela

# agora tem a tabela dentro do BD, trouxe o arquivo, importou, vamos agora converter em uma dataframe

df <- dbReadTable(con, "indices") # criou o objeto dataframe (df)
df # imprimir o dataframe
str(df) # ver o resumo de nossas variaveis
sapply(df,class) # ver a classe cada uma dessas colunas

hist(df$agosto) # pode utilizar um plot para verificar a distribuicao de frequencia de uma das variaveis 
df_mean <- unlist(lapply(df[,c(4,5,6,7,8)], mean)) # pode ainda aplicar a funcao mean para calcular a media de cada uma das colunas
df_mean
# resultado o vetor com as medias do ipca de cad um dos meses.


# lapply, aplica uma funca a cada linha do df (dataframe), toda as linhas
# [, c(4,5,6,7,8)] primeira posicao vazia, que apenas que calcule a media nas colunas 4,5,6,7,8
# o lapply retorna uma lista, logo colocamos unlist() para que possa gravar um vetor direto
# neste objeto

dbDisconnect(con)

# Isso da a vantagem de concetar no banco Oracle, SQL trazer os dados direito 
# para o R processar um dataframe, depois gravar direto em uma tabela, gerar um arquivo
# As possibilidades sao muitas, importante que ja sabemos se conectar em um BD relacional. 





