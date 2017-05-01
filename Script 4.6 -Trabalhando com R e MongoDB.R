###############################################################################
# CURSO:  Formação Cientista de Dados        PLATAFORMA: Data Science Academy #
# MÓDULO: Big Data Analytics com R           INSTRUTOR:  Daniel Mendes        #
# Data: 07/02/2017 - inicio aula: 07:34 pm     dd/mm/2016 - fim aula::pm      #
###############################################################################

# R MongoDB

# Criando uma colecao no MongoDB (abrir o prompt e navegar ate o diretorio bin dentro do diretorio de instalacao do MongoDB e executar)
# ./mongoimport --db users --collection contatos --file /opt/DSA/RFundamentos/Parte3zips.json

# O pacote rmongodb foi descontinuado e nao recebera mais atualizacao. Quando isso acontece, o pacote fica disponivel no
# Archive do CRAN. O pacote ainda pode ser utilizado normalmente, mas precisa fazer download do arquivo e instalar em sua maquina.
# O link para o download esta aqui:https://cran.r-project.org/src/contrib/Archive/rmongodb/.
# O comando para instalar o pacote nao install install.packages("nome_completo_do_pacote", repos = NULL, type = "source").
# Coloque o pacote no mesmo diretorio de trabalho da sua sessao no RStudio.
# O pacote pode ser usado normalmente, embora nao seja mais atualizado pelo criador do pacote.

# RMongo
# RMongoDB
# Instalacao do Pacote
# install.packages("rmongodb")


install.packages("nome_completo_do_pacote", repos = NULL, type = "source")
library(rmongodb)

# Criando a conexÃ£o
help("mongo.create")
mongo <- mongo.create()
mongo

# Checando a conexÃ£o
mongo.is.connected(mongo)

if(mongo.is.connected(mongo) == TRUE) {
  mongo.get.databases(mongo)
}

# Armazenando o nome de uma das colecoes
coll <- "users.contatos"

# Contando os registros em uma colecoes
help("mongo.count")
mongo.count(mongo, coll)

# Buscando um registro em uma colecoes
mongo.find.one(mongo, coll)

# Obtendo um vetor de valores distintos das chaves de uma colecoes
res <- mongo.distinct(mongo, coll, "city")
head(res)

# Obtendo um vetor de valores distintos das chaves de uma colecoes
# E gerando um histograma
pop <- mongo.distinct(mongo, coll, "pop")
hist(pop)

# Contando os elementos
nr <- mongo.count(mongo, coll, list('pop' = list('$lte' = 2)))
print( nr )

# Buscando todos os elementos
pops <- mongo.find.all(mongo, coll, list('pop' = list('$lte' = 2)))
head(pops, 2)

# Encerrando a conexÃ£o
mongo.destroy(mongo)

# Criando e validando um arquivo json
library(jsonlite)
json_arquivo <- '{"pop":{"$lte":2}, "pop":{"$gte":1}}'
cat(prettify(json_arquivo))

validate(json_arquivo)

